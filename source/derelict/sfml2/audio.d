/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.sfml2.audio;


import derelict.util.exception,
       derelict.util.loader,
       derelict.util.system;
import derelict.sfml2.system;

// Audio/Types.h
struct sfMusic;
struct sfSound;
struct sfSoundBuffer;
struct sfSoundBufferRecorder;
struct sfSoundRecorder;
struct sfSoundStream;

// Audio/SoundRecorder.h
extern(C) nothrow {
    alias sfSoundRecorderStartCallback = sfBool function(void*);
    alias sfSoundRecorderProcessCallback = sfBool function(const(sfInt16)*,size_t,void*);
    alias sfSoundRecorderStopCallback = void function(void*);
}

// Audio/SoundStatus.h
alias sfSoundStatus = int;
enum {
    sfStopped,
    sfPaused,
    sfPlaying,
}

// Audio/SoundStream.h
struct sfSoundStreamChunk {
    sfInt16* samples;
    uint sampleCount;
}

extern(C) nothrow {
    alias sfSoundStreamGetDataCallback = sfBool function(sfSoundStreamChunk*,void*);
    alias sfSoundStreamSeekCallback = void function(sfTime,void*);
}


extern(C) @nogc nothrow {
    // Audio/Listener.h
    alias da_sfListener_setGlobalVolume = void function(float);
    alias da_sfListener_getGlobalVolume = float function();
    alias da_sfListener_setPosition = void function(sfVector3f);
    alias da_sfListener_getPosition = sfVector3f function();
    alias da_sfListener_setDirection = void function(sfVector3f);
    alias da_sfListener_getDirection = sfVector3f function();
    alias da_sfListener_setUpVector = void function(sfVector3f);
    alias da_sfListener_getUpVector = sfVector3f function();

    // Audio/Music.h
    alias da_sfMusic_createFromFile = sfMusic* function(const(char)*);
    alias da_sfMusic_createFromMemory = sfMusic* function(const(void)*,size_t);
    alias da_sfMusic_createFromStream = sfMusic* function(sfInputStream*);
    alias da_sfMusic_destroy = void function(sfMusic*);
    alias da_sfMusic_setLoop = void function(sfMusic*,sfBool);
    alias da_sfMusic_getLoop = sfBool function(const(sfMusic)*);
    alias da_sfMusic_getDuration = sfTime function(const(sfMusic)*);
    alias da_sfMusic_play = void function(sfMusic*);
    alias da_sfMusic_pause = void function(sfMusic*);
    alias da_sfMusic_stop = void function(sfMusic*);
    alias da_sfMusic_getChannelCount = uint function(const(sfMusic)*);
    alias da_sfMusic_getSampleRate = uint function(const(sfMusic)*);
    alias da_sfMusic_getStatus = sfSoundStatus function(const(sfMusic)*);
    alias da_sfMusic_getPlayingOffset = sfTime function(const(sfMusic)*);
    alias da_sfMusic_setPitch = void function(sfMusic*,float);
    alias da_sfMusic_setVolume = void function(sfMusic*,float);
    alias da_sfMusic_setPosition = void function(sfMusic*,sfVector3f);
    alias da_sfMusic_setRelativeToListener = void function(sfMusic*,sfBool);
    alias da_sfMusic_setMinDistance = void function(sfMusic*,float);
    alias da_sfMusic_setAttenuation = void function(sfMusic*,float);
    alias da_sfMusic_setPlayingOffset = void function(sfMusic*,sfTime);
    alias da_sfMusic_getPitch = float function(const(sfMusic)*);
    alias da_sfMusic_getVolume = float function(const(sfMusic)*);
    alias da_sfMusic_getPosition = sfVector3f function(const(sfMusic)*);
    alias da_sfMusic_isRelativeToListener = sfBool function(const(sfMusic)*);
    alias da_sfMusic_getMinDistance = float function(const(sfMusic)*);
    alias da_sfMusic_getAttenuation = float function(const(sfMusic)*);

    // Audio/Sound.h
    alias da_sfSound_create = sfSound* function();
    alias da_sfSound_copy = sfSound* function(const(sfSound)*);
    alias da_sfSound_destroy = void function(sfSound*);
    alias da_sfSound_play = void function(sfSound*);
    alias da_sfSound_pause = void function(sfSound*);
    alias da_sfSound_stop = void function(sfSound*);
    alias da_sfSound_setBuffer = void function(sfSound*,const(sfSoundBuffer)*);
    alias da_sfSound_getBuffer = const(sfSoundBuffer)* function(const(sfSound)*);
    alias da_sfSound_setLoop = void function(sfSound*,sfBool);
    alias da_sfSound_getLoop = sfBool function(const(sfSound)*);
    alias da_sfSound_getStatus = sfSoundStatus function(const(sfSound)*);
    alias da_sfSound_setPitch = void function(sfSound*,float);
    alias da_sfSound_setVolume = void function(sfSound*,float);
    alias da_sfSound_setPosition = void function(sfSound*,sfVector3f);
    alias da_sfSound_setRelativeToListener = void function(sfSound*,sfBool);
    alias da_sfSound_setMinDistance = void function(sfSound*,float);
    alias da_sfSound_setAttenuation = void function(sfSound*,float);
    alias da_sfSound_setPlayingOffset = void function(sfSound*,sfTime);
    alias da_sfSound_getPitch = float function(const(sfSound)*);
    alias da_sfSound_getVolume = float function(const(sfSound)*);
    alias da_sfSound_getPosition = sfVector3f function(const(sfSound)*);
    alias da_sfSound_isRelativeToListener = sfBool function(const(sfSound)*);
    alias da_sfSound_getMinDistance = float function(const(sfSound)*);
    alias da_sfSound_getAttenuation = float function(const(sfSound)*);
    alias da_sfSound_getPlayingOffset = sfTime function(const(sfSound)*);

    // Audio/SoundBuffer.h
    alias da_sfSoundBuffer_createFromFile = sfSoundBuffer* function(const(char)*);
    alias da_sfSoundBuffer_createFromMemory = sfSoundBuffer* function(const(void)*,size_t);
    alias da_sfSoundBuffer_createFromStream = sfSoundBuffer* function(sfInputStream*);
    alias da_sfSoundBuffer_createFromSamples = sfSoundBuffer* function(const(sfInt16)*,sfUint64,uint,uint);
    alias da_sfSoundBuffer_copy = sfSoundBuffer* function(const(sfSoundBuffer)*);
    alias da_sfSoundBuffer_destroy = void function(sfSoundBuffer*);
    alias da_sfSoundBuffer_saveToFile = sfBool function(const(sfSoundBuffer)*,const(char)*);
    alias da_sfSoundBuffer_getSamples = const(sfInt16)* function(const(sfSoundBuffer)*);
    alias da_sfSoundBuffer_getSampleCount = sfUint64 function(const(sfSoundBuffer)*);
    alias da_sfSoundBuffer_getSampleRate = uint function(const(sfSoundBuffer)*);
    alias da_sfSoundBuffer_getChannelCount = uint function(const(sfSoundBuffer)*);
    alias da_sfSoundBuffer_getDuration = sfTime function(const(sfSoundBuffer)*);

    // Audio/SoundBufferRecorder.h
    alias da_sfSoundBufferRecorder_create = sfSoundBufferRecorder* function();
    alias da_sfSoundBufferRecorder_destroy = void function(sfSoundBufferRecorder*);
    alias da_sfSoundBufferRecorder_start = sfBool function(sfSoundBufferRecorder*,uint);
    alias da_sfSoundBufferRecorder_stop = void function(sfSoundBufferRecorder*);
    alias da_sfSoundBufferRecorder_getSampleRate = uint function(const(sfSoundBufferRecorder)*);
    alias da_sfSoundBufferRecorder_getBuffer = const(sfSoundBuffer)* function(const(sfSoundBufferRecorder)*);
    alias da_sfSoundBufferRecorder_setDevice = sfBool function(sfSoundBufferRecorder*,const(char)*);
    alias da_sfSoundBufferRecorder_getDevice = const(char)* function(sfSoundBufferRecorder*);

    // Audio/SoundRecorder.h
    alias da_sfSoundRecorder_create = sfSoundRecorder* function(sfSoundRecorderStartCallback,sfSoundRecorderProcessCallback,sfSoundRecorderStopCallback,void*);
    alias da_sfSoundRecorder_destroy = void function(sfSoundRecorder*);
    alias da_sfSoundRecorder_start = sfBool function(sfSoundRecorder*,uint);
    alias da_sfSoundRecorder_stop = void function(sfSoundRecorder*);
    alias da_sfSoundRecorder_getSampleRate = uint function(const(sfSoundRecorder)*);
    alias da_sfSoundRecorder_isAvailable = sfBool function();
    alias da_sfSoundRecorder_setProcessingInterval = void function(sfSoundRecorder*,sfTime);
    alias da_sfSoundRecorder_getAvailableDevices = const(char)** function(size_t*);
    alias da_sfSoundRecorder_getDefaultDevice = const(char)* function();
    alias da_sfSoundRecorder_setDevice = sfBool function(sfSoundRecorder*, const(char)*);
    alias da_sfSoundRecorder_getDevice = const(char)* function(sfSoundRecorder*);
    alias da_sfSoundRecorder_setChannelCount = void function(sfSoundRecorder*,uint);
    alias da_sfSoundRecorder_getChannelCount = uint function(sfSoundRecorder*);

    // Audio/SoundStream.h
    alias da_sfSoundStream_create = sfSoundStream* function(sfSoundStreamGetDataCallback,sfSoundStreamSeekCallback,uint,int,void*);
    alias da_sfSoundStream_destroy = void function(sfSoundStream*);
    alias da_sfSoundStream_play = void function(sfSoundStream*);
    alias da_sfSoundStream_pause = void function(sfSoundStream*);
    alias da_sfSoundStream_stop = void function(sfSoundStream*);
    alias da_sfSoundStream_getStatus = sfSoundStatus function(const(sfSoundStream)*);
    alias da_sfSoundStream_getChannelCount = uint function(const(sfSoundStream)*);
    alias da_sfSoundStream_getSampleRate = uint function(const(sfSoundStream)*);
    alias da_sfSoundStream_setPitch = void function(sfSoundStream*,float);
    alias da_sfSoundStream_setVolume = void function(sfSoundStream*,float);
    alias da_sfSoundStream_setPosition = void function(sfSoundStream*,sfVector3f);
    alias da_sfSoundStream_setRelativeToListener = void function(sfSoundStream*,sfBool);
    alias da_sfSoundStream_setMinDistance = void function(sfSoundStream*,float);
    alias da_sfSoundStream_setAttenuation = void function(sfSoundStream*,float);
    alias da_sfSoundStream_setPlayingOffset = void function(sfSoundStream*,sfTime);
    alias da_sfSoundStream_setLoop = void function(sfSoundStream*,sfBool);
    alias da_sfSoundStream_getPitch = float function(const(sfSoundStream)*);
    alias da_sfSoundStream_getVolume = float function(const(sfSoundStream)*);
    alias da_sfSoundStream_getPosition = sfVector3f function(const(sfSoundStream)*);
    alias da_sfSoundStream_isRelativeToListener = sfBool function(const(sfSoundStream)*);
    alias da_sfSoundStream_getMinDistance = float function(const(sfSoundStream)*);
    alias da_sfSoundStream_getAttenuation = float function(const(sfSoundStream)*);
    alias da_sfSoundStream_getLoop = sfBool function(const(sfSoundStream)*);
    alias da_sfSoundStream_getPlayingOffset = sfTime function(const(sfSoundStream)*);
}

__gshared {
    da_sfListener_setGlobalVolume sfListener_setGlobalVolume;
    da_sfListener_getGlobalVolume sfListener_getGlobalVolume;
    da_sfListener_setPosition sfListener_setPosition;
    da_sfListener_getPosition sfListener_getPosition;
    da_sfListener_setDirection sfListener_setDirection;
    da_sfListener_getDirection sfListener_getDirection;
    da_sfListener_setUpVector sfListener_setUpVector;
    da_sfListener_getUpVector sfListener_getUpVector;

    da_sfMusic_createFromFile sfMusic_createFromFile;
    da_sfMusic_createFromMemory sfMusic_createFromMemory;
    da_sfMusic_createFromStream sfMusic_createFromStream;
    da_sfMusic_destroy sfMusic_destroy;
    da_sfMusic_setLoop sfMusic_setLoop;
    da_sfMusic_getLoop sfMusic_getLoop;
    da_sfMusic_getDuration sfMusic_getDuration;
    da_sfMusic_play sfMusic_play;
    da_sfMusic_pause sfMusic_pause;
    da_sfMusic_stop sfMusic_stop;
    da_sfMusic_getChannelCount sfMusic_getChannelCount;
    da_sfMusic_getSampleRate sfMusic_getSampleRate;
    da_sfMusic_getStatus sfMusic_getStatus;
    da_sfMusic_getPlayingOffset sfMusic_getPlayingOffset;
    da_sfMusic_setPitch sfMusic_setPitch;
    da_sfMusic_setVolume sfMusic_setVolume;
    da_sfMusic_setPosition sfMusic_setPosition;
    da_sfMusic_setRelativeToListener sfMusic_setRelativeToListener;
    da_sfMusic_setMinDistance sfMusic_setMinDistance;
    da_sfMusic_setAttenuation sfMusic_setAttenuation;
    da_sfMusic_setPlayingOffset sfMusic_setPlayingOffset;
    da_sfMusic_getPitch sfMusic_getPitch;
    da_sfMusic_getVolume sfMusic_getVolume;
    da_sfMusic_getPosition sfMusic_getPosition;
    da_sfMusic_isRelativeToListener sfMusic_isRelativeToListener;
    da_sfMusic_getMinDistance sfMusic_getMinDistance;
    da_sfMusic_getAttenuation sfMusic_getAttenuation;

    da_sfSound_create sfSound_create;
    da_sfSound_copy sfSound_copy;
    da_sfSound_destroy sfSound_destroy;
    da_sfSound_play sfSound_play;
    da_sfSound_pause sfSound_pause;
    da_sfSound_stop sfSound_stop;
    da_sfSound_setBuffer sfSound_setBuffer;
    da_sfSound_getBuffer sfSound_getBuffer;
    da_sfSound_setLoop sfSound_setLoop;
    da_sfSound_getLoop sfSound_getLoop;
    da_sfSound_getStatus sfSound_getStatus;
    da_sfSound_setPitch sfSound_setPitch;
    da_sfSound_setVolume sfSound_setVolume;
    da_sfSound_setPosition sfSound_setPosition;
    da_sfSound_setRelativeToListener sfSound_setRelativeToListener;
    da_sfSound_setMinDistance sfSound_setMinDistance;
    da_sfSound_setAttenuation sfSound_setAttenuation;
    da_sfSound_setPlayingOffset sfSound_setPlayingOffset;
    da_sfSound_getPitch sfSound_getPitch;
    da_sfSound_getVolume sfSound_getVolume;
    da_sfSound_getPosition sfSound_getPosition;
    da_sfSound_isRelativeToListener sfSound_isRelativeToListener;
    da_sfSound_getMinDistance sfSound_getMinDistance;
    da_sfSound_getAttenuation sfSound_getAttenuation;
    da_sfSound_getPlayingOffset sfSound_getPlayingOffset;

    da_sfSoundBuffer_createFromFile sfSoundBuffer_createFromFile;
    da_sfSoundBuffer_createFromMemory sfSoundBuffer_createFromMemory;
    da_sfSoundBuffer_createFromStream sfSoundBuffer_createFromStream;
    da_sfSoundBuffer_createFromSamples sfSoundBuffer_createFromSamples;
    da_sfSoundBuffer_copy sfSoundBuffer_copy;
    da_sfSoundBuffer_destroy sfSoundBuffer_destroy;
    da_sfSoundBuffer_saveToFile sfSoundBuffer_saveToFile;
    da_sfSoundBuffer_getSamples sfSoundBuffer_getSamples;
    da_sfSoundBuffer_getSampleCount sfSoundBuffer_getSampleCount;
    da_sfSoundBuffer_getSampleRate sfSoundBuffer_getSampleRate;
    da_sfSoundBuffer_getChannelCount sfSoundBuffer_getChannelCount;
    da_sfSoundBuffer_getDuration sfSoundBuffer_getDuration;

    da_sfSoundBufferRecorder_create sfSoundBufferRecorder_create;
    da_sfSoundBufferRecorder_destroy sfSoundBufferRecorder_destroy;
    da_sfSoundBufferRecorder_start sfSoundBufferRecorder_start;
    da_sfSoundBufferRecorder_stop sfSoundBufferRecorder_stop;
    da_sfSoundBufferRecorder_getSampleRate sfSoundBufferRecorder_getSampleRate;
    da_sfSoundBufferRecorder_getBuffer sfSoundBufferRecorder_getBuffer;
    da_sfSoundBufferRecorder_setDevice sfSoundBufferRecorder_setDevice;
    da_sfSoundBufferRecorder_getDevice sfSoundBufferRecorder_getDevice;

    da_sfSoundRecorder_create sfSoundRecorder_create;
    da_sfSoundRecorder_destroy sfSoundRecorder_destroy;
    da_sfSoundRecorder_start sfSoundRecorder_start;
    da_sfSoundRecorder_stop sfSoundRecorder_stop;
    da_sfSoundRecorder_getSampleRate sfSoundRecorder_getSampleRate;
    da_sfSoundRecorder_isAvailable sfSoundRecorder_isAvailable;
    da_sfSoundRecorder_setProcessingInterval sfSoundRecorder_setProcessingInterval;
    da_sfSoundRecorder_getAvailableDevices sfSoundRecorder_getAvailableDevices;
    da_sfSoundRecorder_getDefaultDevice sfSoundRecorder_getDefaultDevice;
    da_sfSoundRecorder_setDevice sfSoundRecorder_setDevice;
    da_sfSoundRecorder_getDevice sfSoundRecorder_getDevice;
    da_sfSoundRecorder_setChannelCount sfSoundRecorder_setChannelCount;
    da_sfSoundRecorder_getChannelCount sfSoundRecorder_getChannelCount;

    da_sfSoundStream_create sfSoundStream_create;
    da_sfSoundStream_destroy sfSoundStream_destroy;
    da_sfSoundStream_play sfSoundStream_play;
    da_sfSoundStream_pause sfSoundStream_pause;
    da_sfSoundStream_stop sfSoundStream_stop;
    da_sfSoundStream_getStatus sfSoundStream_getStatus;
    da_sfSoundStream_getChannelCount sfSoundStream_getChannelCount;
    da_sfSoundStream_getSampleRate sfSoundStream_getSampleRate;
    da_sfSoundStream_setPitch sfSoundStream_setPitch;
    da_sfSoundStream_setVolume sfSoundStream_setVolume;
    da_sfSoundStream_setPosition sfSoundStream_setPosition;
    da_sfSoundStream_setRelativeToListener sfSoundStream_setRelativeToListener;
    da_sfSoundStream_setMinDistance sfSoundStream_setMinDistance;
    da_sfSoundStream_setAttenuation sfSoundStream_setAttenuation;
    da_sfSoundStream_setPlayingOffset sfSoundStream_setPlayingOffset;
    da_sfSoundStream_setLoop sfSoundStream_setLoop;
    da_sfSoundStream_getPitch sfSoundStream_getPitch;
    da_sfSoundStream_getVolume sfSoundStream_getVolume;
    da_sfSoundStream_getPosition sfSoundStream_getPosition;
    da_sfSoundStream_isRelativeToListener sfSoundStream_isRelativeToListener;
    da_sfSoundStream_getMinDistance sfSoundStream_getMinDistance;
    da_sfSoundStream_getAttenuation sfSoundStream_getAttenuation;
    da_sfSoundStream_getLoop sfSoundStream_getLoop;
    da_sfSoundStream_getPlayingOffset sfSoundStream_getPlayingOffset;
}

class DerelictSFML2AudioLoader : SharedLibLoader {
    this() 
    {
        super(libNames);
    }

    protected override void loadSymbols() 
    {
        bindFunc(cast(void**)&sfListener_setGlobalVolume, "sfListener_setGlobalVolume");
        bindFunc(cast(void**)&sfListener_getGlobalVolume, "sfListener_getGlobalVolume");
        bindFunc(cast(void**)&sfListener_setPosition, "sfListener_setPosition");
        bindFunc(cast(void**)&sfListener_getPosition, "sfListener_getPosition");
        bindFunc(cast(void**)&sfListener_setDirection, "sfListener_setDirection");
        bindFunc(cast(void**)&sfListener_getDirection, "sfListener_getDirection");
        bindFunc(cast(void**)&sfListener_setUpVector, "sfListener_setUpVector");
        bindFunc(cast(void**)&sfListener_getUpVector, "sfListener_getUpVector");
        bindFunc(cast(void**)&sfMusic_createFromFile, "sfMusic_createFromFile");
        bindFunc(cast(void**)&sfMusic_createFromMemory, "sfMusic_createFromMemory");
        bindFunc(cast(void**)&sfMusic_createFromStream, "sfMusic_createFromStream");
        bindFunc(cast(void**)&sfMusic_destroy, "sfMusic_destroy");
        bindFunc(cast(void**)&sfMusic_setLoop, "sfMusic_setLoop");
        bindFunc(cast(void**)&sfMusic_getLoop, "sfMusic_getLoop");
        bindFunc(cast(void**)&sfMusic_getDuration, "sfMusic_getDuration");
        bindFunc(cast(void**)&sfMusic_play, "sfMusic_play");
        bindFunc(cast(void**)&sfMusic_pause, "sfMusic_pause");
        bindFunc(cast(void**)&sfMusic_stop, "sfMusic_stop");
        bindFunc(cast(void**)&sfMusic_getChannelCount, "sfMusic_getChannelCount");
        bindFunc(cast(void**)&sfMusic_getSampleRate, "sfMusic_getSampleRate");
        bindFunc(cast(void**)&sfMusic_getStatus, "sfMusic_getStatus");
        bindFunc(cast(void**)&sfMusic_getPlayingOffset, "sfMusic_getPlayingOffset");
        bindFunc(cast(void**)&sfMusic_setPitch, "sfMusic_setPitch");
        bindFunc(cast(void**)&sfMusic_setVolume, "sfMusic_setVolume");
        bindFunc(cast(void**)&sfMusic_setPosition, "sfMusic_setPosition");
        bindFunc(cast(void**)&sfMusic_setRelativeToListener, "sfMusic_setRelativeToListener");
        bindFunc(cast(void**)&sfMusic_setMinDistance, "sfMusic_setMinDistance");
        bindFunc(cast(void**)&sfMusic_setAttenuation, "sfMusic_setAttenuation");
        bindFunc(cast(void**)&sfMusic_setPlayingOffset, "sfMusic_setPlayingOffset");
        bindFunc(cast(void**)&sfMusic_getPitch, "sfMusic_getPitch");
        bindFunc(cast(void**)&sfMusic_getVolume, "sfMusic_getVolume");
        bindFunc(cast(void**)&sfMusic_getPosition, "sfMusic_getPosition");
        bindFunc(cast(void**)&sfMusic_isRelativeToListener, "sfMusic_isRelativeToListener");
        bindFunc(cast(void**)&sfMusic_getMinDistance, "sfMusic_getMinDistance");
        bindFunc(cast(void**)&sfMusic_getAttenuation, "sfMusic_getAttenuation");
        bindFunc(cast(void**)&sfSound_create, "sfSound_create");
        bindFunc(cast(void**)&sfSound_copy, "sfSound_copy");
        bindFunc(cast(void**)&sfSound_destroy, "sfSound_destroy");
        bindFunc(cast(void**)&sfSound_play, "sfSound_play");
        bindFunc(cast(void**)&sfSound_pause, "sfSound_pause");
        bindFunc(cast(void**)&sfSound_stop, "sfSound_stop");
        bindFunc(cast(void**)&sfSound_setBuffer, "sfSound_setBuffer");
        bindFunc(cast(void**)&sfSound_getBuffer, "sfSound_getBuffer");
        bindFunc(cast(void**)&sfSound_setLoop, "sfSound_setLoop");
        bindFunc(cast(void**)&sfSound_getLoop, "sfSound_getLoop");
        bindFunc(cast(void**)&sfSound_getStatus, "sfSound_getStatus");
        bindFunc(cast(void**)&sfSound_setPitch, "sfSound_setPitch");
        bindFunc(cast(void**)&sfSound_setVolume, "sfSound_setVolume");
        bindFunc(cast(void**)&sfSound_setPosition, "sfSound_setPosition");
        bindFunc(cast(void**)&sfSound_setRelativeToListener, "sfSound_setRelativeToListener");
        bindFunc(cast(void**)&sfSound_setMinDistance, "sfSound_setMinDistance");
        bindFunc(cast(void**)&sfSound_setAttenuation, "sfSound_setAttenuation");
        bindFunc(cast(void**)&sfSound_setPlayingOffset, "sfSound_setPlayingOffset");
        bindFunc(cast(void**)&sfSound_getPitch, "sfSound_getPitch");
        bindFunc(cast(void**)&sfSound_getVolume, "sfSound_getVolume");
        bindFunc(cast(void**)&sfSound_getPosition, "sfSound_getPosition");
        bindFunc(cast(void**)&sfSound_isRelativeToListener, "sfSound_isRelativeToListener");
        bindFunc(cast(void**)&sfSound_getMinDistance, "sfSound_getMinDistance");
        bindFunc(cast(void**)&sfSound_getAttenuation, "sfSound_getAttenuation");
        bindFunc(cast(void**)&sfSound_getPlayingOffset, "sfSound_getPlayingOffset");
        bindFunc(cast(void**)&sfSoundBuffer_createFromFile, "sfSoundBuffer_createFromFile");
        bindFunc(cast(void**)&sfSoundBuffer_createFromMemory, "sfSoundBuffer_createFromMemory");
        bindFunc(cast(void**)&sfSoundBuffer_createFromStream, "sfSoundBuffer_createFromStream");
        bindFunc(cast(void**)&sfSoundBuffer_createFromSamples, "sfSoundBuffer_createFromSamples");
        bindFunc(cast(void**)&sfSoundBuffer_copy, "sfSoundBuffer_copy");
        bindFunc(cast(void**)&sfSoundBuffer_destroy, "sfSoundBuffer_destroy");
        bindFunc(cast(void**)&sfSoundBuffer_saveToFile, "sfSoundBuffer_saveToFile");
        bindFunc(cast(void**)&sfSoundBuffer_getSamples, "sfSoundBuffer_getSamples");
        bindFunc(cast(void**)&sfSoundBuffer_getSampleCount, "sfSoundBuffer_getSampleCount");
        bindFunc(cast(void**)&sfSoundBuffer_getSampleRate, "sfSoundBuffer_getSampleRate");
        bindFunc(cast(void**)&sfSoundBuffer_getChannelCount, "sfSoundBuffer_getChannelCount");
        bindFunc(cast(void**)&sfSoundBuffer_getDuration, "sfSoundBuffer_getDuration");
        bindFunc(cast(void**)&sfSoundBufferRecorder_create, "sfSoundBufferRecorder_create");
        bindFunc(cast(void**)&sfSoundBufferRecorder_destroy, "sfSoundBufferRecorder_destroy");
        bindFunc(cast(void**)&sfSoundBufferRecorder_start, "sfSoundBufferRecorder_start");
        bindFunc(cast(void**)&sfSoundBufferRecorder_stop, "sfSoundBufferRecorder_stop");
        bindFunc(cast(void**)&sfSoundBufferRecorder_getSampleRate, "sfSoundBufferRecorder_getSampleRate");
        bindFunc(cast(void**)&sfSoundBufferRecorder_getBuffer, "sfSoundBufferRecorder_getBuffer");
        bindFunc(cast(void**)&sfSoundBufferRecorder_setDevice, "sfSoundBufferRecorder_setDevice");
        bindFunc(cast(void**)&sfSoundBufferRecorder_getDevice, "sfSoundBufferRecorder_getDevice");
        bindFunc(cast(void**)&sfSoundRecorder_create, "sfSoundRecorder_create");
        bindFunc(cast(void**)&sfSoundRecorder_destroy, "sfSoundRecorder_destroy");
        bindFunc(cast(void**)&sfSoundRecorder_start, "sfSoundRecorder_start");
        bindFunc(cast(void**)&sfSoundRecorder_stop, "sfSoundRecorder_stop");
        bindFunc(cast(void**)&sfSoundRecorder_getSampleRate, "sfSoundRecorder_getSampleRate");
        bindFunc(cast(void**)&sfSoundRecorder_isAvailable, "sfSoundRecorder_isAvailable");
        bindFunc(cast(void**)&sfSoundRecorder_setProcessingInterval, "sfSoundRecorder_setProcessingInterval");
        bindFunc(cast(void**)&sfSoundRecorder_getAvailableDevices, "sfSoundRecorder_getAvailableDevices");
        bindFunc(cast(void**)&sfSoundRecorder_getDefaultDevice, "sfSoundRecorder_getDefaultDevice");
        bindFunc(cast(void**)&sfSoundRecorder_setDevice, "sfSoundRecorder_setDevice");
        bindFunc(cast(void**)&sfSoundRecorder_getDevice, "sfSoundRecorder_getDevice");
        bindFunc(cast(void**)&sfSoundRecorder_setChannelCount, "sfSoundRecorder_setChannelCount");
        bindFunc(cast(void**)&sfSoundRecorder_getChannelCount, "sfSoundRecorder_getChannelCount");
        bindFunc(cast(void**)&sfSoundStream_create, "sfSoundStream_create");
        bindFunc(cast(void**)&sfSoundStream_destroy, "sfSoundStream_destroy");
        bindFunc(cast(void**)&sfSoundStream_play, "sfSoundStream_play");
        bindFunc(cast(void**)&sfSoundStream_pause, "sfSoundStream_pause");
        bindFunc(cast(void**)&sfSoundStream_stop, "sfSoundStream_stop");
        bindFunc(cast(void**)&sfSoundStream_getStatus, "sfSoundStream_getStatus");
        bindFunc(cast(void**)&sfSoundStream_getChannelCount, "sfSoundStream_getChannelCount");
        bindFunc(cast(void**)&sfSoundStream_getSampleRate, "sfSoundStream_getSampleRate");
        bindFunc(cast(void**)&sfSoundStream_setPitch, "sfSoundStream_setPitch");
        bindFunc(cast(void**)&sfSoundStream_setVolume, "sfSoundStream_setVolume");
        bindFunc(cast(void**)&sfSoundStream_setPosition, "sfSoundStream_setPosition");
        bindFunc(cast(void**)&sfSoundStream_setRelativeToListener, "sfSoundStream_setRelativeToListener");
        bindFunc(cast(void**)&sfSoundStream_setMinDistance, "sfSoundStream_setMinDistance");
        bindFunc(cast(void**)&sfSoundStream_setAttenuation, "sfSoundStream_setAttenuation");
        bindFunc(cast(void**)&sfSoundStream_setPlayingOffset, "sfSoundStream_setPlayingOffset");
        bindFunc(cast(void**)&sfSoundStream_setLoop, "sfSoundStream_setLoop");
        bindFunc(cast(void**)&sfSoundStream_getPitch, "sfSoundStream_getPitch");
        bindFunc(cast(void**)&sfSoundStream_getVolume, "sfSoundStream_getVolume");
        bindFunc(cast(void**)&sfSoundStream_getPosition, "sfSoundStream_getPosition");
        bindFunc(cast(void**)&sfSoundStream_isRelativeToListener, "sfSoundStream_isRelativeToListener");
        bindFunc(cast(void**)&sfSoundStream_getMinDistance, "sfSoundStream_getMinDistance");
        bindFunc(cast(void**)&sfSoundStream_getAttenuation, "sfSoundStream_getAttenuation");
        bindFunc(cast(void**)&sfSoundStream_getLoop, "sfSoundStream_getLoop");
        bindFunc(cast(void**)&sfSoundStream_getPlayingOffset, "sfSoundStream_getPlayingOffset");
    }
}

__gshared DerelictSFML2AudioLoader DerelictSFML2Audio;

shared static this() 
{
    DerelictSFML2Audio = new DerelictSFML2AudioLoader();
}

private:
    static if(Derelict_OS_Windows)
        enum libNames = "csfml-audio.dll,csfml-audio-2.dll,csmfl-audio-2.4.dll";
    else static if(Derelict_OS_Mac)
        enum libNames = "libcsfml-audio.dylib,libcsfml-audio.2.dylib,libcsfml-audio.2.4.dylib";
    else static if(Derelict_OS_Posix)
        enum libNames = "libcsfml-audio.so,libcsfml-audio.so.2,libcsfml-audio.so.2.4";
    else
        static assert(0, "Need to implement SFML2 Audio libNames for this operating system.");
