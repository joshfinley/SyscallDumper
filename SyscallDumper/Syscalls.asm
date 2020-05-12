.code


NtAcceptConnectPort proc
			mov r10, rcx
			mov eax, 2
			syscall
			ret
NtAcceptConnectPort endp

NtAccessCheck proc
			mov r10, rcx
			mov eax, 0
			syscall
			ret
NtAccessCheck endp

NtAccessCheckAndAuditAlarm proc
			mov r10, rcx
			mov eax, 41
			syscall
			ret
NtAccessCheckAndAuditAlarm endp

NtAccessCheckByType proc
			mov r10, rcx
			mov eax, 99
			syscall
			ret
NtAccessCheckByType endp

NtAccessCheckByTypeAndAuditAlarm proc
			mov r10, rcx
			mov eax, 89
			syscall
			ret
NtAccessCheckByTypeAndAuditAlarm endp

NtAccessCheckByTypeResultList proc
			mov r10, rcx
			mov eax, 100
			syscall
			ret
NtAccessCheckByTypeResultList endp

NtAccessCheckByTypeResultListAndAuditAlarm proc
			mov r10, rcx
			mov eax, 101
			syscall
			ret
NtAccessCheckByTypeResultListAndAuditAlarm endp

NtAccessCheckByTypeResultListAndAuditAlarmByHandle proc
			mov r10, rcx
			mov eax, 102
			syscall
			ret
NtAccessCheckByTypeResultListAndAuditAlarmByHandle endp

NtAcquireProcessActivityReference proc
			mov r10, rcx
			mov eax, 103
			syscall
			ret
NtAcquireProcessActivityReference endp

NtAddAtom proc
			mov r10, rcx
			mov eax, 71
			syscall
			ret
NtAddAtom endp

NtAddAtomEx proc
			mov r10, rcx
			mov eax, 104
			syscall
			ret
NtAddAtomEx endp

NtAddBootEntry proc
			mov r10, rcx
			mov eax, 105
			syscall
			ret
NtAddBootEntry endp

NtAddDriverEntry proc
			mov r10, rcx
			mov eax, 106
			syscall
			ret
NtAddDriverEntry endp

NtAdjustGroupsToken proc
			mov r10, rcx
			mov eax, 107
			syscall
			ret
NtAdjustGroupsToken endp

NtAdjustPrivilegesToken proc
			mov r10, rcx
			mov eax, 65
			syscall
			ret
NtAdjustPrivilegesToken endp

NtAdjustTokenClaimsAndDeviceGroups proc
			mov r10, rcx
			mov eax, 108
			syscall
			ret
NtAdjustTokenClaimsAndDeviceGroups endp

NtAlertResumeThread proc
			mov r10, rcx
			mov eax, 109
			syscall
			ret
NtAlertResumeThread endp

NtAlertThread proc
			mov r10, rcx
			mov eax, 110
			syscall
			ret
NtAlertThread endp

NtAlertThreadByThreadId proc
			mov r10, rcx
			mov eax, 111
			syscall
			ret
NtAlertThreadByThreadId endp

NtAllocateLocallyUniqueId proc
			mov r10, rcx
			mov eax, 112
			syscall
			ret
NtAllocateLocallyUniqueId endp

NtAllocateReserveObject proc
			mov r10, rcx
			mov eax, 113
			syscall
			ret
NtAllocateReserveObject endp

NtAllocateUserPhysicalPages proc
			mov r10, rcx
			mov eax, 114
			syscall
			ret
NtAllocateUserPhysicalPages endp

NtAllocateUuids proc
			mov r10, rcx
			mov eax, 115
			syscall
			ret
NtAllocateUuids endp

NtAllocateVirtualMemory proc
			mov r10, rcx
			mov eax, 24
			syscall
			ret
NtAllocateVirtualMemory endp

NtAllocateVirtualMemoryEx proc
			mov r10, rcx
			mov eax, 116
			syscall
			ret
NtAllocateVirtualMemoryEx endp

NtAlpcAcceptConnectPort proc
			mov r10, rcx
			mov eax, 117
			syscall
			ret
NtAlpcAcceptConnectPort endp

NtAlpcCancelMessage proc
			mov r10, rcx
			mov eax, 118
			syscall
			ret
NtAlpcCancelMessage endp

NtAlpcConnectPort proc
			mov r10, rcx
			mov eax, 119
			syscall
			ret
NtAlpcConnectPort endp

NtAlpcConnectPortEx proc
			mov r10, rcx
			mov eax, 120
			syscall
			ret
NtAlpcConnectPortEx endp

NtAlpcCreatePort proc
			mov r10, rcx
			mov eax, 121
			syscall
			ret
NtAlpcCreatePort endp

NtAlpcCreatePortSection proc
			mov r10, rcx
			mov eax, 122
			syscall
			ret
NtAlpcCreatePortSection endp

NtAlpcCreateResourceReserve proc
			mov r10, rcx
			mov eax, 123
			syscall
			ret
NtAlpcCreateResourceReserve endp

NtAlpcCreateSectionView proc
			mov r10, rcx
			mov eax, 124
			syscall
			ret
NtAlpcCreateSectionView endp

NtAlpcCreateSecurityContext proc
			mov r10, rcx
			mov eax, 125
			syscall
			ret
NtAlpcCreateSecurityContext endp

NtAlpcDeletePortSection proc
			mov r10, rcx
			mov eax, 126
			syscall
			ret
NtAlpcDeletePortSection endp

NtAlpcDeleteResourceReserve proc
			mov r10, rcx
			mov eax, 127
			syscall
			ret
NtAlpcDeleteResourceReserve endp

NtAlpcDeleteSectionView proc
			mov r10, rcx
			mov eax, 128
			syscall
			ret
NtAlpcDeleteSectionView endp

NtAlpcDeleteSecurityContext proc
			mov r10, rcx
			mov eax, 129
			syscall
			ret
NtAlpcDeleteSecurityContext endp

NtAlpcDisconnectPort proc
			mov r10, rcx
			mov eax, 130
			syscall
			ret
NtAlpcDisconnectPort endp

NtAlpcImpersonateClientContainerOfPort proc
			mov r10, rcx
			mov eax, 131
			syscall
			ret
NtAlpcImpersonateClientContainerOfPort endp

NtAlpcImpersonateClientOfPort proc
			mov r10, rcx
			mov eax, 132
			syscall
			ret
NtAlpcImpersonateClientOfPort endp

NtAlpcOpenSenderProcess proc
			mov r10, rcx
			mov eax, 133
			syscall
			ret
NtAlpcOpenSenderProcess endp

NtAlpcOpenSenderThread proc
			mov r10, rcx
			mov eax, 134
			syscall
			ret
NtAlpcOpenSenderThread endp

NtAlpcQueryInformation proc
			mov r10, rcx
			mov eax, 135
			syscall
			ret
NtAlpcQueryInformation endp

NtAlpcQueryInformationMessage proc
			mov r10, rcx
			mov eax, 136
			syscall
			ret
NtAlpcQueryInformationMessage endp

NtAlpcRevokeSecurityContext proc
			mov r10, rcx
			mov eax, 137
			syscall
			ret
NtAlpcRevokeSecurityContext endp

NtAlpcSendWaitReceivePort proc
			mov r10, rcx
			mov eax, 138
			syscall
			ret
NtAlpcSendWaitReceivePort endp

NtAlpcSetInformation proc
			mov r10, rcx
			mov eax, 139
			syscall
			ret
NtAlpcSetInformation endp

NtApphelpCacheControl proc
			mov r10, rcx
			mov eax, 76
			syscall
			ret
NtApphelpCacheControl endp

NtAreMappedFilesTheSame proc
			mov r10, rcx
			mov eax, 140
			syscall
			ret
NtAreMappedFilesTheSame endp

NtAssignProcessToJobObject proc
			mov r10, rcx
			mov eax, 141
			syscall
			ret
NtAssignProcessToJobObject endp

NtAssociateWaitCompletionPacket proc
			mov r10, rcx
			mov eax, 142
			syscall
			ret
NtAssociateWaitCompletionPacket endp

NtCallEnclave proc
			mov r10, rcx
			mov eax, 143
			syscall
			ret
NtCallEnclave endp

NtCallbackReturn proc
			mov r10, rcx
			mov eax, 5
			syscall
			ret
NtCallbackReturn endp

NtCancelIoFile proc
			mov r10, rcx
			mov eax, 93
			syscall
			ret
NtCancelIoFile endp

NtCancelIoFileEx proc
			mov r10, rcx
			mov eax, 144
			syscall
			ret
NtCancelIoFileEx endp

NtCancelSynchronousIoFile proc
			mov r10, rcx
			mov eax, 145
			syscall
			ret
NtCancelSynchronousIoFile endp

NtCancelTimer proc
			mov r10, rcx
			mov eax, 97
			syscall
			ret
NtCancelTimer endp

NtCancelTimer2 proc
			mov r10, rcx
			mov eax, 146
			syscall
			ret
NtCancelTimer2 endp

NtCancelWaitCompletionPacket proc
			mov r10, rcx
			mov eax, 147
			syscall
			ret
NtCancelWaitCompletionPacket endp

NtClearEvent proc
			mov r10, rcx
			mov eax, 62
			syscall
			ret
NtClearEvent endp

NtClose proc
			mov r10, rcx
			mov eax, 15
			syscall
			ret
NtClose endp

NtCloseObjectAuditAlarm proc
			mov r10, rcx
			mov eax, 59
			syscall
			ret
NtCloseObjectAuditAlarm endp

NtCommitComplete proc
			mov r10, rcx
			mov eax, 148
			syscall
			ret
NtCommitComplete endp

NtCommitEnlistment proc
			mov r10, rcx
			mov eax, 149
			syscall
			ret
NtCommitEnlistment endp

NtCommitRegistryTransaction proc
			mov r10, rcx
			mov eax, 150
			syscall
			ret
NtCommitRegistryTransaction endp

NtCommitTransaction proc
			mov r10, rcx
			mov eax, 151
			syscall
			ret
NtCommitTransaction endp

NtCompactKeys proc
			mov r10, rcx
			mov eax, 152
			syscall
			ret
NtCompactKeys endp

NtCompareObjects proc
			mov r10, rcx
			mov eax, 153
			syscall
			ret
NtCompareObjects endp

NtCompareSigningLevels proc
			mov r10, rcx
			mov eax, 154
			syscall
			ret
NtCompareSigningLevels endp

NtCompareTokens proc
			mov r10, rcx
			mov eax, 155
			syscall
			ret
NtCompareTokens endp

NtCompleteConnectPort proc
			mov r10, rcx
			mov eax, 156
			syscall
			ret
NtCompleteConnectPort endp

NtCompressKey proc
			mov r10, rcx
			mov eax, 157
			syscall
			ret
NtCompressKey endp

NtConnectPort proc
			mov r10, rcx
			mov eax, 158
			syscall
			ret
NtConnectPort endp

NtContinue proc
			mov r10, rcx
			mov eax, 67
			syscall
			ret
NtContinue endp

NtConvertBetweenAuxiliaryCounterAndPerformanceCounter proc
			mov r10, rcx
			mov eax, 159
			syscall
			ret
NtConvertBetweenAuxiliaryCounterAndPerformanceCounter endp

NtCreateCrossVmEvent proc
			mov r10, rcx
			mov eax, 160
			syscall
			ret
NtCreateCrossVmEvent endp

NtCreateDebugObject proc
			mov r10, rcx
			mov eax, 161
			syscall
			ret
NtCreateDebugObject endp

NtCreateDirectoryObject proc
			mov r10, rcx
			mov eax, 162
			syscall
			ret
NtCreateDirectoryObject endp

NtCreateDirectoryObjectEx proc
			mov r10, rcx
			mov eax, 163
			syscall
			ret
NtCreateDirectoryObjectEx endp

NtCreateEnclave proc
			mov r10, rcx
			mov eax, 164
			syscall
			ret
NtCreateEnclave endp

NtCreateEnlistment proc
			mov r10, rcx
			mov eax, 165
			syscall
			ret
NtCreateEnlistment endp

NtCreateEvent proc
			mov r10, rcx
			mov eax, 72
			syscall
			ret
NtCreateEvent endp

NtCreateEventPair proc
			mov r10, rcx
			mov eax, 166
			syscall
			ret
NtCreateEventPair endp

NtCreateFile proc
			mov r10, rcx
			mov eax, 85
			syscall
			ret
NtCreateFile endp

NtCreateIRTimer proc
			mov r10, rcx
			mov eax, 167
			syscall
			ret
NtCreateIRTimer endp

NtCreateIoCompletion proc
			mov r10, rcx
			mov eax, 168
			syscall
			ret
NtCreateIoCompletion endp

NtCreateJobObject proc
			mov r10, rcx
			mov eax, 169
			syscall
			ret
NtCreateJobObject endp

NtCreateJobSet proc
			mov r10, rcx
			mov eax, 170
			syscall
			ret
NtCreateJobSet endp

NtCreateKey proc
			mov r10, rcx
			mov eax, 29
			syscall
			ret
NtCreateKey endp

NtCreateKeyTransacted proc
			mov r10, rcx
			mov eax, 171
			syscall
			ret
NtCreateKeyTransacted endp

NtCreateKeyedEvent proc
			mov r10, rcx
			mov eax, 172
			syscall
			ret
NtCreateKeyedEvent endp

NtCreateLowBoxToken proc
			mov r10, rcx
			mov eax, 173
			syscall
			ret
NtCreateLowBoxToken endp

NtCreateMailslotFile proc
			mov r10, rcx
			mov eax, 174
			syscall
			ret
NtCreateMailslotFile endp

NtCreateMutant proc
			mov r10, rcx
			mov eax, 175
			syscall
			ret
NtCreateMutant endp

NtCreateNamedPipeFile proc
			mov r10, rcx
			mov eax, 176
			syscall
			ret
NtCreateNamedPipeFile endp

NtCreatePagingFile proc
			mov r10, rcx
			mov eax, 177
			syscall
			ret
NtCreatePagingFile endp

NtCreatePartition proc
			mov r10, rcx
			mov eax, 178
			syscall
			ret
NtCreatePartition endp

NtCreatePort proc
			mov r10, rcx
			mov eax, 179
			syscall
			ret
NtCreatePort endp

NtCreatePrivateNamespace proc
			mov r10, rcx
			mov eax, 180
			syscall
			ret
NtCreatePrivateNamespace endp

NtCreateProcess proc
			mov r10, rcx
			mov eax, 181
			syscall
			ret
NtCreateProcess endp

NtCreateProcessEx proc
			mov r10, rcx
			mov eax, 77
			syscall
			ret
NtCreateProcessEx endp

NtCreateProfile proc
			mov r10, rcx
			mov eax, 182
			syscall
			ret
NtCreateProfile endp

NtCreateProfileEx proc
			mov r10, rcx
			mov eax, 183
			syscall
			ret
NtCreateProfileEx endp

NtCreateRegistryTransaction proc
			mov r10, rcx
			mov eax, 184
			syscall
			ret
NtCreateRegistryTransaction endp

NtCreateResourceManager proc
			mov r10, rcx
			mov eax, 185
			syscall
			ret
NtCreateResourceManager endp

NtCreateSection proc
			mov r10, rcx
			mov eax, 74
			syscall
			ret
NtCreateSection endp

NtCreateSectionEx proc
			mov r10, rcx
			mov eax, 186
			syscall
			ret
NtCreateSectionEx endp

NtCreateSemaphore proc
			mov r10, rcx
			mov eax, 187
			syscall
			ret
NtCreateSemaphore endp

NtCreateSymbolicLinkObject proc
			mov r10, rcx
			mov eax, 188
			syscall
			ret
NtCreateSymbolicLinkObject endp

NtCreateThread proc
			mov r10, rcx
			mov eax, 78
			syscall
			ret
NtCreateThread endp

NtCreateThreadEx proc
			mov r10, rcx
			mov eax, 189
			syscall
			ret
NtCreateThreadEx endp

NtCreateTimer proc
			mov r10, rcx
			mov eax, 190
			syscall
			ret
NtCreateTimer endp

NtCreateTimer2 proc
			mov r10, rcx
			mov eax, 191
			syscall
			ret
NtCreateTimer2 endp

NtCreateToken proc
			mov r10, rcx
			mov eax, 192
			syscall
			ret
NtCreateToken endp

NtCreateTokenEx proc
			mov r10, rcx
			mov eax, 193
			syscall
			ret
NtCreateTokenEx endp

NtCreateTransaction proc
			mov r10, rcx
			mov eax, 194
			syscall
			ret
NtCreateTransaction endp

NtCreateTransactionManager proc
			mov r10, rcx
			mov eax, 195
			syscall
			ret
NtCreateTransactionManager endp

NtCreateUserProcess proc
			mov r10, rcx
			mov eax, 196
			syscall
			ret
NtCreateUserProcess endp

NtCreateWaitCompletionPacket proc
			mov r10, rcx
			mov eax, 197
			syscall
			ret
NtCreateWaitCompletionPacket endp

NtCreateWaitablePort proc
			mov r10, rcx
			mov eax, 198
			syscall
			ret
NtCreateWaitablePort endp

NtCreateWnfStateName proc
			mov r10, rcx
			mov eax, 199
			syscall
			ret
NtCreateWnfStateName endp

NtCreateWorkerFactory proc
			mov r10, rcx
			mov eax, 200
			syscall
			ret
NtCreateWorkerFactory endp

NtDebugActiveProcess proc
			mov r10, rcx
			mov eax, 201
			syscall
			ret
NtDebugActiveProcess endp

NtDebugContinue proc
			mov r10, rcx
			mov eax, 202
			syscall
			ret
NtDebugContinue endp

NtDelayExecution proc
			mov r10, rcx
			mov eax, 52
			syscall
			ret
NtDelayExecution endp

NtDeleteAtom proc
			mov r10, rcx
			mov eax, 203
			syscall
			ret
NtDeleteAtom endp

NtDeleteBootEntry proc
			mov r10, rcx
			mov eax, 204
			syscall
			ret
NtDeleteBootEntry endp

NtDeleteDriverEntry proc
			mov r10, rcx
			mov eax, 205
			syscall
			ret
NtDeleteDriverEntry endp

NtDeleteFile proc
			mov r10, rcx
			mov eax, 206
			syscall
			ret
NtDeleteFile endp

NtDeleteKey proc
			mov r10, rcx
			mov eax, 207
			syscall
			ret
NtDeleteKey endp

NtDeleteObjectAuditAlarm proc
			mov r10, rcx
			mov eax, 208
			syscall
			ret
NtDeleteObjectAuditAlarm endp

NtDeletePrivateNamespace proc
			mov r10, rcx
			mov eax, 209
			syscall
			ret
NtDeletePrivateNamespace endp

NtDeleteValueKey proc
			mov r10, rcx
			mov eax, 210
			syscall
			ret
NtDeleteValueKey endp

NtDeleteWnfStateData proc
			mov r10, rcx
			mov eax, 211
			syscall
			ret
NtDeleteWnfStateData endp

NtDeleteWnfStateName proc
			mov r10, rcx
			mov eax, 212
			syscall
			ret
NtDeleteWnfStateName endp

NtDeviceIoControlFile proc
			mov r10, rcx
			mov eax, 7
			syscall
			ret
NtDeviceIoControlFile endp

NtDisableLastKnownGood proc
			mov r10, rcx
			mov eax, 213
			syscall
			ret
NtDisableLastKnownGood endp

NtDisplayString proc
			mov r10, rcx
			mov eax, 214
			syscall
			ret
NtDisplayString endp

NtDrawText proc
			mov r10, rcx
			mov eax, 215
			syscall
			ret
NtDrawText endp

NtDuplicateObject proc
			mov r10, rcx
			mov eax, 60
			syscall
			ret
NtDuplicateObject endp

NtDuplicateToken proc
			mov r10, rcx
			mov eax, 66
			syscall
			ret
NtDuplicateToken endp

NtEnableLastKnownGood proc
			mov r10, rcx
			mov eax, 216
			syscall
			ret
NtEnableLastKnownGood endp

NtEnumerateBootEntries proc
			mov r10, rcx
			mov eax, 217
			syscall
			ret
NtEnumerateBootEntries endp

NtEnumerateDriverEntries proc
			mov r10, rcx
			mov eax, 218
			syscall
			ret
NtEnumerateDriverEntries endp

NtEnumerateKey proc
			mov r10, rcx
			mov eax, 50
			syscall
			ret
NtEnumerateKey endp

NtEnumerateSystemEnvironmentValuesEx proc
			mov r10, rcx
			mov eax, 219
			syscall
			ret
NtEnumerateSystemEnvironmentValuesEx endp

NtEnumerateTransactionObject proc
			mov r10, rcx
			mov eax, 220
			syscall
			ret
NtEnumerateTransactionObject endp

NtEnumerateValueKey proc
			mov r10, rcx
			mov eax, 19
			syscall
			ret
NtEnumerateValueKey endp

NtExtendSection proc
			mov r10, rcx
			mov eax, 221
			syscall
			ret
NtExtendSection endp

NtFilterBootOption proc
			mov r10, rcx
			mov eax, 222
			syscall
			ret
NtFilterBootOption endp

NtFilterToken proc
			mov r10, rcx
			mov eax, 223
			syscall
			ret
NtFilterToken endp

NtFilterTokenEx proc
			mov r10, rcx
			mov eax, 224
			syscall
			ret
NtFilterTokenEx endp

NtFindAtom proc
			mov r10, rcx
			mov eax, 20
			syscall
			ret
NtFindAtom endp

NtFlushBuffersFile proc
			mov r10, rcx
			mov eax, 75
			syscall
			ret
NtFlushBuffersFile endp

NtFlushBuffersFileEx proc
			mov r10, rcx
			mov eax, 225
			syscall
			ret
NtFlushBuffersFileEx endp

NtFlushInstallUILanguage proc
			mov r10, rcx
			mov eax, 226
			syscall
			ret
NtFlushInstallUILanguage endp

NtFlushInstructionCache proc
			mov r10, rcx
			mov eax, 227
			syscall
			ret
NtFlushInstructionCache endp

NtFlushKey proc
			mov r10, rcx
			mov eax, 228
			syscall
			ret
NtFlushKey endp

NtFlushProcessWriteBuffers proc
			mov r10, rcx
			mov eax, 229
			syscall
			ret
NtFlushProcessWriteBuffers endp

NtFlushVirtualMemory proc
			mov r10, rcx
			mov eax, 230
			syscall
			ret
NtFlushVirtualMemory endp

NtFlushWriteBuffer proc
			mov r10, rcx
			mov eax, 231
			syscall
			ret
NtFlushWriteBuffer endp

NtFreeUserPhysicalPages proc
			mov r10, rcx
			mov eax, 232
			syscall
			ret
NtFreeUserPhysicalPages endp

NtFreeVirtualMemory proc
			mov r10, rcx
			mov eax, 30
			syscall
			ret
NtFreeVirtualMemory endp

NtFreezeRegistry proc
			mov r10, rcx
			mov eax, 233
			syscall
			ret
NtFreezeRegistry endp

NtFreezeTransactions proc
			mov r10, rcx
			mov eax, 234
			syscall
			ret
NtFreezeTransactions endp

NtFsControlFile proc
			mov r10, rcx
			mov eax, 57
			syscall
			ret
NtFsControlFile endp

NtGetCachedSigningLevel proc
			mov r10, rcx
			mov eax, 235
			syscall
			ret
NtGetCachedSigningLevel endp

NtGetCompleteWnfStateSubscription proc
			mov r10, rcx
			mov eax, 236
			syscall
			ret
NtGetCompleteWnfStateSubscription endp

NtGetContextThread proc
			mov r10, rcx
			mov eax, 237
			syscall
			ret
NtGetContextThread endp

NtGetCurrentProcessorNumber proc
			mov r10, rcx
			mov eax, 238
			syscall
			ret
NtGetCurrentProcessorNumber endp

NtGetCurrentProcessorNumberEx proc
			mov r10, rcx
			mov eax, 239
			syscall
			ret
NtGetCurrentProcessorNumberEx endp

NtGetDevicePowerState proc
			mov r10, rcx
			mov eax, 240
			syscall
			ret
NtGetDevicePowerState endp

NtGetMUIRegistryInfo proc
			mov r10, rcx
			mov eax, 241
			syscall
			ret
NtGetMUIRegistryInfo endp

NtGetNextProcess proc
			mov r10, rcx
			mov eax, 242
			syscall
			ret
NtGetNextProcess endp

NtGetNextThread proc
			mov r10, rcx
			mov eax, 243
			syscall
			ret
NtGetNextThread endp

NtGetNlsSectionPtr proc
			mov r10, rcx
			mov eax, 244
			syscall
			ret
NtGetNlsSectionPtr endp

NtGetNotificationResourceManager proc
			mov r10, rcx
			mov eax, 245
			syscall
			ret
NtGetNotificationResourceManager endp

NtGetWriteWatch proc
			mov r10, rcx
			mov eax, 246
			syscall
			ret
NtGetWriteWatch endp

NtImpersonateAnonymousToken proc
			mov r10, rcx
			mov eax, 247
			syscall
			ret
NtImpersonateAnonymousToken endp

NtImpersonateClientOfPort proc
			mov r10, rcx
			mov eax, 31
			syscall
			ret
NtImpersonateClientOfPort endp

NtImpersonateThread proc
			mov r10, rcx
			mov eax, 248
			syscall
			ret
NtImpersonateThread endp

NtInitializeEnclave proc
			mov r10, rcx
			mov eax, 249
			syscall
			ret
NtInitializeEnclave endp

NtInitializeNlsFiles proc
			mov r10, rcx
			mov eax, 250
			syscall
			ret
NtInitializeNlsFiles endp

NtInitializeRegistry proc
			mov r10, rcx
			mov eax, 251
			syscall
			ret
NtInitializeRegistry endp

NtInitiatePowerAction proc
			mov r10, rcx
			mov eax, 252
			syscall
			ret
NtInitiatePowerAction endp

NtIsProcessInJob proc
			mov r10, rcx
			mov eax, 79
			syscall
			ret
NtIsProcessInJob endp

NtIsSystemResumeAutomatic proc
			mov r10, rcx
			mov eax, 253
			syscall
			ret
NtIsSystemResumeAutomatic endp

NtIsUILanguageComitted proc
			mov r10, rcx
			mov eax, 254
			syscall
			ret
NtIsUILanguageComitted endp

NtListenPort proc
			mov r10, rcx
			mov eax, 255
			syscall
			ret
NtListenPort endp

NtLoadDriver proc
			mov r10, rcx
			mov eax, 256
			syscall
			ret
NtLoadDriver endp

NtLoadEnclaveData proc
			mov r10, rcx
			mov eax, 257
			syscall
			ret
NtLoadEnclaveData endp

NtLoadKey proc
			mov r10, rcx
			mov eax, 258
			syscall
			ret
NtLoadKey endp

NtLoadKey2 proc
			mov r10, rcx
			mov eax, 259
			syscall
			ret
NtLoadKey2 endp

NtLoadKeyEx proc
			mov r10, rcx
			mov eax, 260
			syscall
			ret
NtLoadKeyEx endp

NtLockFile proc
			mov r10, rcx
			mov eax, 261
			syscall
			ret
NtLockFile endp

NtLockProductActivationKeys proc
			mov r10, rcx
			mov eax, 262
			syscall
			ret
NtLockProductActivationKeys endp

NtLockRegistryKey proc
			mov r10, rcx
			mov eax, 263
			syscall
			ret
NtLockRegistryKey endp

NtLockVirtualMemory proc
			mov r10, rcx
			mov eax, 264
			syscall
			ret
NtLockVirtualMemory endp

NtMakePermanentObject proc
			mov r10, rcx
			mov eax, 265
			syscall
			ret
NtMakePermanentObject endp

NtMakeTemporaryObject proc
			mov r10, rcx
			mov eax, 266
			syscall
			ret
NtMakeTemporaryObject endp

NtManageHotPatch proc
			mov r10, rcx
			mov eax, 267
			syscall
			ret
NtManageHotPatch endp

NtManagePartition proc
			mov r10, rcx
			mov eax, 268
			syscall
			ret
NtManagePartition endp

NtMapCMFModule proc
			mov r10, rcx
			mov eax, 269
			syscall
			ret
NtMapCMFModule endp

NtMapUserPhysicalPages proc
			mov r10, rcx
			mov eax, 270
			syscall
			ret
NtMapUserPhysicalPages endp

NtMapUserPhysicalPagesScatter proc
			mov r10, rcx
			mov eax, 3
			syscall
			ret
NtMapUserPhysicalPagesScatter endp

NtMapViewOfSection proc
			mov r10, rcx
			mov eax, 40
			syscall
			ret
NtMapViewOfSection endp

NtMapViewOfSectionEx proc
			mov r10, rcx
			mov eax, 271
			syscall
			ret
NtMapViewOfSectionEx endp

NtModifyBootEntry proc
			mov r10, rcx
			mov eax, 272
			syscall
			ret
NtModifyBootEntry endp

NtModifyDriverEntry proc
			mov r10, rcx
			mov eax, 273
			syscall
			ret
NtModifyDriverEntry endp

NtNotifyChangeDirectoryFile proc
			mov r10, rcx
			mov eax, 274
			syscall
			ret
NtNotifyChangeDirectoryFile endp

NtNotifyChangeDirectoryFileEx proc
			mov r10, rcx
			mov eax, 275
			syscall
			ret
NtNotifyChangeDirectoryFileEx endp

NtNotifyChangeKey proc
			mov r10, rcx
			mov eax, 276
			syscall
			ret
NtNotifyChangeKey endp

NtNotifyChangeMultipleKeys proc
			mov r10, rcx
			mov eax, 277
			syscall
			ret
NtNotifyChangeMultipleKeys endp

NtNotifyChangeSession proc
			mov r10, rcx
			mov eax, 278
			syscall
			ret
NtNotifyChangeSession endp

NtOpenDirectoryObject proc
			mov r10, rcx
			mov eax, 88
			syscall
			ret
NtOpenDirectoryObject endp

NtOpenEnlistment proc
			mov r10, rcx
			mov eax, 279
			syscall
			ret
NtOpenEnlistment endp

NtOpenEvent proc
			mov r10, rcx
			mov eax, 64
			syscall
			ret
NtOpenEvent endp

NtOpenEventPair proc
			mov r10, rcx
			mov eax, 280
			syscall
			ret
NtOpenEventPair endp

NtOpenFile proc
			mov r10, rcx
			mov eax, 51
			syscall
			ret
NtOpenFile endp

NtOpenIoCompletion proc
			mov r10, rcx
			mov eax, 281
			syscall
			ret
NtOpenIoCompletion endp

NtOpenJobObject proc
			mov r10, rcx
			mov eax, 282
			syscall
			ret
NtOpenJobObject endp

NtOpenKey proc
			mov r10, rcx
			mov eax, 18
			syscall
			ret
NtOpenKey endp

NtOpenKeyEx proc
			mov r10, rcx
			mov eax, 283
			syscall
			ret
NtOpenKeyEx endp

NtOpenKeyTransacted proc
			mov r10, rcx
			mov eax, 284
			syscall
			ret
NtOpenKeyTransacted endp

NtOpenKeyTransactedEx proc
			mov r10, rcx
			mov eax, 285
			syscall
			ret
NtOpenKeyTransactedEx endp

NtOpenKeyedEvent proc
			mov r10, rcx
			mov eax, 286
			syscall
			ret
NtOpenKeyedEvent endp

NtOpenMutant proc
			mov r10, rcx
			mov eax, 287
			syscall
			ret
NtOpenMutant endp

NtOpenObjectAuditAlarm proc
			mov r10, rcx
			mov eax, 288
			syscall
			ret
NtOpenObjectAuditAlarm endp

NtOpenPartition proc
			mov r10, rcx
			mov eax, 289
			syscall
			ret
NtOpenPartition endp

NtOpenPrivateNamespace proc
			mov r10, rcx
			mov eax, 290
			syscall
			ret
NtOpenPrivateNamespace endp

NtOpenProcess proc
			mov r10, rcx
			mov eax, 38
			syscall
			ret
NtOpenProcess endp

NtOpenProcessToken proc
			mov r10, rcx
			mov eax, 291
			syscall
			ret
NtOpenProcessToken endp

NtOpenProcessTokenEx proc
			mov r10, rcx
			mov eax, 48
			syscall
			ret
NtOpenProcessTokenEx endp

NtOpenRegistryTransaction proc
			mov r10, rcx
			mov eax, 292
			syscall
			ret
NtOpenRegistryTransaction endp

NtOpenResourceManager proc
			mov r10, rcx
			mov eax, 293
			syscall
			ret
NtOpenResourceManager endp

NtOpenSection proc
			mov r10, rcx
			mov eax, 55
			syscall
			ret
NtOpenSection endp

NtOpenSemaphore proc
			mov r10, rcx
			mov eax, 294
			syscall
			ret
NtOpenSemaphore endp

NtOpenSession proc
			mov r10, rcx
			mov eax, 295
			syscall
			ret
NtOpenSession endp

NtOpenSymbolicLinkObject proc
			mov r10, rcx
			mov eax, 296
			syscall
			ret
NtOpenSymbolicLinkObject endp

NtOpenThread proc
			mov r10, rcx
			mov eax, 297
			syscall
			ret
NtOpenThread endp

NtOpenThreadToken proc
			mov r10, rcx
			mov eax, 36
			syscall
			ret
NtOpenThreadToken endp

NtOpenThreadTokenEx proc
			mov r10, rcx
			mov eax, 47
			syscall
			ret
NtOpenThreadTokenEx endp

NtOpenTimer proc
			mov r10, rcx
			mov eax, 298
			syscall
			ret
NtOpenTimer endp

NtOpenTransaction proc
			mov r10, rcx
			mov eax, 299
			syscall
			ret
NtOpenTransaction endp

NtOpenTransactionManager proc
			mov r10, rcx
			mov eax, 300
			syscall
			ret
NtOpenTransactionManager endp

NtPlugPlayControl proc
			mov r10, rcx
			mov eax, 301
			syscall
			ret
NtPlugPlayControl endp

NtPowerInformation proc
			mov r10, rcx
			mov eax, 95
			syscall
			ret
NtPowerInformation endp

NtPrePrepareComplete proc
			mov r10, rcx
			mov eax, 302
			syscall
			ret
NtPrePrepareComplete endp

NtPrePrepareEnlistment proc
			mov r10, rcx
			mov eax, 303
			syscall
			ret
NtPrePrepareEnlistment endp

NtPrepareComplete proc
			mov r10, rcx
			mov eax, 304
			syscall
			ret
NtPrepareComplete endp

NtPrepareEnlistment proc
			mov r10, rcx
			mov eax, 305
			syscall
			ret
NtPrepareEnlistment endp

NtPrivilegeCheck proc
			mov r10, rcx
			mov eax, 306
			syscall
			ret
NtPrivilegeCheck endp

NtPrivilegeObjectAuditAlarm proc
			mov r10, rcx
			mov eax, 307
			syscall
			ret
NtPrivilegeObjectAuditAlarm endp

NtPrivilegedServiceAuditAlarm proc
			mov r10, rcx
			mov eax, 308
			syscall
			ret
NtPrivilegedServiceAuditAlarm endp

NtPropagationComplete proc
			mov r10, rcx
			mov eax, 309
			syscall
			ret
NtPropagationComplete endp

NtPropagationFailed proc
			mov r10, rcx
			mov eax, 310
			syscall
			ret
NtPropagationFailed endp

NtProtectVirtualMemory proc
			mov r10, rcx
			mov eax, 80
			syscall
			ret
NtProtectVirtualMemory endp

NtPulseEvent proc
			mov r10, rcx
			mov eax, 311
			syscall
			ret
NtPulseEvent endp

NtQueryAttributesFile proc
			mov r10, rcx
			mov eax, 61
			syscall
			ret
NtQueryAttributesFile endp

NtQueryAuxiliaryCounterFrequency proc
			mov r10, rcx
			mov eax, 312
			syscall
			ret
NtQueryAuxiliaryCounterFrequency endp

NtQueryBootEntryOrder proc
			mov r10, rcx
			mov eax, 313
			syscall
			ret
NtQueryBootEntryOrder endp

NtQueryBootOptions proc
			mov r10, rcx
			mov eax, 314
			syscall
			ret
NtQueryBootOptions endp

NtQueryDebugFilterState proc
			mov r10, rcx
			mov eax, 315
			syscall
			ret
NtQueryDebugFilterState endp

NtQueryDefaultLocale proc
			mov r10, rcx
			mov eax, 21
			syscall
			ret
NtQueryDefaultLocale endp

NtQueryDefaultUILanguage proc
			mov r10, rcx
			mov eax, 68
			syscall
			ret
NtQueryDefaultUILanguage endp

NtQueryDirectoryFile proc
			mov r10, rcx
			mov eax, 53
			syscall
			ret
NtQueryDirectoryFile endp

NtQueryDirectoryFileEx proc
			mov r10, rcx
			mov eax, 316
			syscall
			ret
NtQueryDirectoryFileEx endp

NtQueryDirectoryObject proc
			mov r10, rcx
			mov eax, 317
			syscall
			ret
NtQueryDirectoryObject endp

NtQueryDriverEntryOrder proc
			mov r10, rcx
			mov eax, 318
			syscall
			ret
NtQueryDriverEntryOrder endp

NtQueryEaFile proc
			mov r10, rcx
			mov eax, 319
			syscall
			ret
NtQueryEaFile endp

NtQueryEvent proc
			mov r10, rcx
			mov eax, 86
			syscall
			ret
NtQueryEvent endp

NtQueryFullAttributesFile proc
			mov r10, rcx
			mov eax, 320
			syscall
			ret
NtQueryFullAttributesFile endp

NtQueryInformationAtom proc
			mov r10, rcx
			mov eax, 321
			syscall
			ret
NtQueryInformationAtom endp

NtQueryInformationByName proc
			mov r10, rcx
			mov eax, 322
			syscall
			ret
NtQueryInformationByName endp

NtQueryInformationEnlistment proc
			mov r10, rcx
			mov eax, 323
			syscall
			ret
NtQueryInformationEnlistment endp

NtQueryInformationFile proc
			mov r10, rcx
			mov eax, 17
			syscall
			ret
NtQueryInformationFile endp

NtQueryInformationJobObject proc
			mov r10, rcx
			mov eax, 324
			syscall
			ret
NtQueryInformationJobObject endp

NtQueryInformationPort proc
			mov r10, rcx
			mov eax, 325
			syscall
			ret
NtQueryInformationPort endp

NtQueryInformationProcess proc
			mov r10, rcx
			mov eax, 25
			syscall
			ret
NtQueryInformationProcess endp

NtQueryInformationResourceManager proc
			mov r10, rcx
			mov eax, 326
			syscall
			ret
NtQueryInformationResourceManager endp

NtQueryInformationThread proc
			mov r10, rcx
			mov eax, 37
			syscall
			ret
NtQueryInformationThread endp

NtQueryInformationToken proc
			mov r10, rcx
			mov eax, 33
			syscall
			ret
NtQueryInformationToken endp

NtQueryInformationTransaction proc
			mov r10, rcx
			mov eax, 327
			syscall
			ret
NtQueryInformationTransaction endp

NtQueryInformationTransactionManager proc
			mov r10, rcx
			mov eax, 328
			syscall
			ret
NtQueryInformationTransactionManager endp

NtQueryInformationWorkerFactory proc
			mov r10, rcx
			mov eax, 329
			syscall
			ret
NtQueryInformationWorkerFactory endp

NtQueryInstallUILanguage proc
			mov r10, rcx
			mov eax, 330
			syscall
			ret
NtQueryInstallUILanguage endp

NtQueryIntervalProfile proc
			mov r10, rcx
			mov eax, 331
			syscall
			ret
NtQueryIntervalProfile endp

NtQueryIoCompletion proc
			mov r10, rcx
			mov eax, 332
			syscall
			ret
NtQueryIoCompletion endp

NtQueryKey proc
			mov r10, rcx
			mov eax, 22
			syscall
			ret
NtQueryKey endp

NtQueryLicenseValue proc
			mov r10, rcx
			mov eax, 333
			syscall
			ret
NtQueryLicenseValue endp

NtQueryMultipleValueKey proc
			mov r10, rcx
			mov eax, 334
			syscall
			ret
NtQueryMultipleValueKey endp

NtQueryMutant proc
			mov r10, rcx
			mov eax, 335
			syscall
			ret
NtQueryMutant endp

NtQueryObject proc
			mov r10, rcx
			mov eax, 16
			syscall
			ret
NtQueryObject endp

NtQueryOpenSubKeys proc
			mov r10, rcx
			mov eax, 336
			syscall
			ret
NtQueryOpenSubKeys endp

NtQueryOpenSubKeysEx proc
			mov r10, rcx
			mov eax, 337
			syscall
			ret
NtQueryOpenSubKeysEx endp

NtQueryPerformanceCounter proc
			mov r10, rcx
			mov eax, 49
			syscall
			ret
NtQueryPerformanceCounter endp

NtQueryPortInformationProcess proc
			mov r10, rcx
			mov eax, 338
			syscall
			ret
NtQueryPortInformationProcess endp

NtQueryQuotaInformationFile proc
			mov r10, rcx
			mov eax, 339
			syscall
			ret
NtQueryQuotaInformationFile endp

NtQuerySection proc
			mov r10, rcx
			mov eax, 81
			syscall
			ret
NtQuerySection endp

NtQuerySecurityAttributesToken proc
			mov r10, rcx
			mov eax, 340
			syscall
			ret
NtQuerySecurityAttributesToken endp

NtQuerySecurityObject proc
			mov r10, rcx
			mov eax, 341
			syscall
			ret
NtQuerySecurityObject endp

NtQuerySecurityPolicy proc
			mov r10, rcx
			mov eax, 342
			syscall
			ret
NtQuerySecurityPolicy endp

NtQuerySemaphore proc
			mov r10, rcx
			mov eax, 343
			syscall
			ret
NtQuerySemaphore endp

NtQuerySymbolicLinkObject proc
			mov r10, rcx
			mov eax, 344
			syscall
			ret
NtQuerySymbolicLinkObject endp

NtQuerySystemEnvironmentValue proc
			mov r10, rcx
			mov eax, 345
			syscall
			ret
NtQuerySystemEnvironmentValue endp

NtQuerySystemEnvironmentValueEx proc
			mov r10, rcx
			mov eax, 346
			syscall
			ret
NtQuerySystemEnvironmentValueEx endp

NtQuerySystemInformation proc
			mov r10, rcx
			mov eax, 54
			syscall
			ret
NtQuerySystemInformation endp

NtQuerySystemInformationEx proc
			mov r10, rcx
			mov eax, 347
			syscall
			ret
NtQuerySystemInformationEx endp

NtQuerySystemTime proc
			mov r10, rcx
			mov eax, 1791
			syscall
			ret
NtQuerySystemTime endp

NtQueryTimer proc
			mov r10, rcx
			mov eax, 56
			syscall
			ret
NtQueryTimer endp

NtQueryTimerResolution proc
			mov r10, rcx
			mov eax, 348
			syscall
			ret
NtQueryTimerResolution endp

NtQueryValueKey proc
			mov r10, rcx
			mov eax, 23
			syscall
			ret
NtQueryValueKey endp

NtQueryVirtualMemory proc
			mov r10, rcx
			mov eax, 35
			syscall
			ret
NtQueryVirtualMemory endp

NtQueryVolumeInformationFile proc
			mov r10, rcx
			mov eax, 73
			syscall
			ret
NtQueryVolumeInformationFile endp

NtQueryWnfStateData proc
			mov r10, rcx
			mov eax, 349
			syscall
			ret
NtQueryWnfStateData endp

NtQueryWnfStateNameInformation proc
			mov r10, rcx
			mov eax, 350
			syscall
			ret
NtQueryWnfStateNameInformation endp

NtQueueApcThread proc
			mov r10, rcx
			mov eax, 69
			syscall
			ret
NtQueueApcThread endp

NtQueueApcThreadEx proc
			mov r10, rcx
			mov eax, 351
			syscall
			ret
NtQueueApcThreadEx endp

NtRaiseException proc
			mov r10, rcx
			mov eax, 352
			syscall
			ret
NtRaiseException endp

NtRaiseHardError proc
			mov r10, rcx
			mov eax, 353
			syscall
			ret
NtRaiseHardError endp

NtReadFile proc
			mov r10, rcx
			mov eax, 6
			syscall
			ret
NtReadFile endp

NtReadFileScatter proc
			mov r10, rcx
			mov eax, 46
			syscall
			ret
NtReadFileScatter endp

NtReadOnlyEnlistment proc
			mov r10, rcx
			mov eax, 354
			syscall
			ret
NtReadOnlyEnlistment endp

NtReadRequestData proc
			mov r10, rcx
			mov eax, 84
			syscall
			ret
NtReadRequestData endp

NtReadVirtualMemory proc
			mov r10, rcx
			mov eax, 63
			syscall
			ret
NtReadVirtualMemory endp

NtRecoverEnlistment proc
			mov r10, rcx
			mov eax, 355
			syscall
			ret
NtRecoverEnlistment endp

NtRecoverResourceManager proc
			mov r10, rcx
			mov eax, 356
			syscall
			ret
NtRecoverResourceManager endp

NtRecoverTransactionManager proc
			mov r10, rcx
			mov eax, 357
			syscall
			ret
NtRecoverTransactionManager endp

NtRegisterProtocolAddressInformation proc
			mov r10, rcx
			mov eax, 358
			syscall
			ret
NtRegisterProtocolAddressInformation endp

NtRegisterThreadTerminatePort proc
			mov r10, rcx
			mov eax, 359
			syscall
			ret
NtRegisterThreadTerminatePort endp

NtReleaseKeyedEvent proc
			mov r10, rcx
			mov eax, 360
			syscall
			ret
NtReleaseKeyedEvent endp

NtReleaseMutant proc
			mov r10, rcx
			mov eax, 32
			syscall
			ret
NtReleaseMutant endp

NtReleaseSemaphore proc
			mov r10, rcx
			mov eax, 10
			syscall
			ret
NtReleaseSemaphore endp

NtReleaseWorkerFactoryWorker proc
			mov r10, rcx
			mov eax, 361
			syscall
			ret
NtReleaseWorkerFactoryWorker endp

NtRemoveIoCompletion proc
			mov r10, rcx
			mov eax, 9
			syscall
			ret
NtRemoveIoCompletion endp

NtRemoveIoCompletionEx proc
			mov r10, rcx
			mov eax, 362
			syscall
			ret
NtRemoveIoCompletionEx endp

NtRemoveProcessDebug proc
			mov r10, rcx
			mov eax, 363
			syscall
			ret
NtRemoveProcessDebug endp

NtRenameKey proc
			mov r10, rcx
			mov eax, 364
			syscall
			ret
NtRenameKey endp

NtRenameTransactionManager proc
			mov r10, rcx
			mov eax, 365
			syscall
			ret
NtRenameTransactionManager endp

NtReplaceKey proc
			mov r10, rcx
			mov eax, 366
			syscall
			ret
NtReplaceKey endp

NtReplacePartitionUnit proc
			mov r10, rcx
			mov eax, 367
			syscall
			ret
NtReplacePartitionUnit endp

NtReplyPort proc
			mov r10, rcx
			mov eax, 12
			syscall
			ret
NtReplyPort endp

NtReplyWaitReceivePort proc
			mov r10, rcx
			mov eax, 11
			syscall
			ret
NtReplyWaitReceivePort endp

NtReplyWaitReceivePortEx proc
			mov r10, rcx
			mov eax, 43
			syscall
			ret
NtReplyWaitReceivePortEx endp

NtReplyWaitReplyPort proc
			mov r10, rcx
			mov eax, 368
			syscall
			ret
NtReplyWaitReplyPort endp

NtRequestPort proc
			mov r10, rcx
			mov eax, 369
			syscall
			ret
NtRequestPort endp

NtRequestWaitReplyPort proc
			mov r10, rcx
			mov eax, 34
			syscall
			ret
NtRequestWaitReplyPort endp

NtResetEvent proc
			mov r10, rcx
			mov eax, 370
			syscall
			ret
NtResetEvent endp

NtResetWriteWatch proc
			mov r10, rcx
			mov eax, 371
			syscall
			ret
NtResetWriteWatch endp

NtRestoreKey proc
			mov r10, rcx
			mov eax, 372
			syscall
			ret
NtRestoreKey endp

NtResumeProcess proc
			mov r10, rcx
			mov eax, 373
			syscall
			ret
NtResumeProcess endp

NtResumeThread proc
			mov r10, rcx
			mov eax, 82
			syscall
			ret
NtResumeThread endp

NtRevertContainerImpersonation proc
			mov r10, rcx
			mov eax, 374
			syscall
			ret
NtRevertContainerImpersonation endp

NtRollbackComplete proc
			mov r10, rcx
			mov eax, 375
			syscall
			ret
NtRollbackComplete endp

NtRollbackEnlistment proc
			mov r10, rcx
			mov eax, 376
			syscall
			ret
NtRollbackEnlistment endp

NtRollbackRegistryTransaction proc
			mov r10, rcx
			mov eax, 377
			syscall
			ret
NtRollbackRegistryTransaction endp

NtRollbackTransaction proc
			mov r10, rcx
			mov eax, 378
			syscall
			ret
NtRollbackTransaction endp

NtRollforwardTransactionManager proc
			mov r10, rcx
			mov eax, 379
			syscall
			ret
NtRollforwardTransactionManager endp

NtSaveKey proc
			mov r10, rcx
			mov eax, 380
			syscall
			ret
NtSaveKey endp

NtSaveKeyEx proc
			mov r10, rcx
			mov eax, 381
			syscall
			ret
NtSaveKeyEx endp

NtSaveMergedKeys proc
			mov r10, rcx
			mov eax, 382
			syscall
			ret
NtSaveMergedKeys endp

NtSecureConnectPort proc
			mov r10, rcx
			mov eax, 383
			syscall
			ret
NtSecureConnectPort endp

NtSerializeBoot proc
			mov r10, rcx
			mov eax, 384
			syscall
			ret
NtSerializeBoot endp

NtSetBootEntryOrder proc
			mov r10, rcx
			mov eax, 385
			syscall
			ret
NtSetBootEntryOrder endp

NtSetBootOptions proc
			mov r10, rcx
			mov eax, 386
			syscall
			ret
NtSetBootOptions endp

NtSetCachedSigningLevel proc
			mov r10, rcx
			mov eax, 387
			syscall
			ret
NtSetCachedSigningLevel endp

NtSetCachedSigningLevel2 proc
			mov r10, rcx
			mov eax, 388
			syscall
			ret
NtSetCachedSigningLevel2 endp

NtSetContextThread proc
			mov r10, rcx
			mov eax, 389
			syscall
			ret
NtSetContextThread endp

NtSetDebugFilterState proc
			mov r10, rcx
			mov eax, 390
			syscall
			ret
NtSetDebugFilterState endp

NtSetDefaultHardErrorPort proc
			mov r10, rcx
			mov eax, 391
			syscall
			ret
NtSetDefaultHardErrorPort endp

NtSetDefaultLocale proc
			mov r10, rcx
			mov eax, 392
			syscall
			ret
NtSetDefaultLocale endp

NtSetDefaultUILanguage proc
			mov r10, rcx
			mov eax, 393
			syscall
			ret
NtSetDefaultUILanguage endp

NtSetDriverEntryOrder proc
			mov r10, rcx
			mov eax, 394
			syscall
			ret
NtSetDriverEntryOrder endp

NtSetEaFile proc
			mov r10, rcx
			mov eax, 395
			syscall
			ret
NtSetEaFile endp

NtSetEvent proc
			mov r10, rcx
			mov eax, 14
			syscall
			ret
NtSetEvent endp

NtSetEventBoostPriority proc
			mov r10, rcx
			mov eax, 45
			syscall
			ret
NtSetEventBoostPriority endp

NtSetHighEventPair proc
			mov r10, rcx
			mov eax, 396
			syscall
			ret
NtSetHighEventPair endp

NtSetHighWaitLowEventPair proc
			mov r10, rcx
			mov eax, 397
			syscall
			ret
NtSetHighWaitLowEventPair endp

NtSetIRTimer proc
			mov r10, rcx
			mov eax, 398
			syscall
			ret
NtSetIRTimer endp

NtSetInformationDebugObject proc
			mov r10, rcx
			mov eax, 399
			syscall
			ret
NtSetInformationDebugObject endp

NtSetInformationEnlistment proc
			mov r10, rcx
			mov eax, 400
			syscall
			ret
NtSetInformationEnlistment endp

NtSetInformationFile proc
			mov r10, rcx
			mov eax, 39
			syscall
			ret
NtSetInformationFile endp

NtSetInformationJobObject proc
			mov r10, rcx
			mov eax, 401
			syscall
			ret
NtSetInformationJobObject endp

NtSetInformationKey proc
			mov r10, rcx
			mov eax, 402
			syscall
			ret
NtSetInformationKey endp

NtSetInformationObject proc
			mov r10, rcx
			mov eax, 92
			syscall
			ret
NtSetInformationObject endp

NtSetInformationProcess proc
			mov r10, rcx
			mov eax, 28
			syscall
			ret
NtSetInformationProcess endp

NtSetInformationResourceManager proc
			mov r10, rcx
			mov eax, 403
			syscall
			ret
NtSetInformationResourceManager endp

NtSetInformationSymbolicLink proc
			mov r10, rcx
			mov eax, 404
			syscall
			ret
NtSetInformationSymbolicLink endp

NtSetInformationThread proc
			mov r10, rcx
			mov eax, 13
			syscall
			ret
NtSetInformationThread endp

NtSetInformationToken proc
			mov r10, rcx
			mov eax, 405
			syscall
			ret
NtSetInformationToken endp

NtSetInformationTransaction proc
			mov r10, rcx
			mov eax, 406
			syscall
			ret
NtSetInformationTransaction endp

NtSetInformationTransactionManager proc
			mov r10, rcx
			mov eax, 407
			syscall
			ret
NtSetInformationTransactionManager endp

NtSetInformationVirtualMemory proc
			mov r10, rcx
			mov eax, 408
			syscall
			ret
NtSetInformationVirtualMemory endp

NtSetInformationWorkerFactory proc
			mov r10, rcx
			mov eax, 409
			syscall
			ret
NtSetInformationWorkerFactory endp

NtSetIntervalProfile proc
			mov r10, rcx
			mov eax, 410
			syscall
			ret
NtSetIntervalProfile endp

NtSetIoCompletion proc
			mov r10, rcx
			mov eax, 411
			syscall
			ret
NtSetIoCompletion endp

NtSetIoCompletionEx proc
			mov r10, rcx
			mov eax, 412
			syscall
			ret
NtSetIoCompletionEx endp

NtSetLdtEntries proc
			mov r10, rcx
			mov eax, 413
			syscall
			ret
NtSetLdtEntries endp

NtSetLowEventPair proc
			mov r10, rcx
			mov eax, 414
			syscall
			ret
NtSetLowEventPair endp

NtSetLowWaitHighEventPair proc
			mov r10, rcx
			mov eax, 415
			syscall
			ret
NtSetLowWaitHighEventPair endp

NtSetQuotaInformationFile proc
			mov r10, rcx
			mov eax, 416
			syscall
			ret
NtSetQuotaInformationFile endp

NtSetSecurityObject proc
			mov r10, rcx
			mov eax, 417
			syscall
			ret
NtSetSecurityObject endp

NtSetSystemEnvironmentValue proc
			mov r10, rcx
			mov eax, 418
			syscall
			ret
NtSetSystemEnvironmentValue endp

NtSetSystemEnvironmentValueEx proc
			mov r10, rcx
			mov eax, 419
			syscall
			ret
NtSetSystemEnvironmentValueEx endp

NtSetSystemInformation proc
			mov r10, rcx
			mov eax, 420
			syscall
			ret
NtSetSystemInformation endp

NtSetSystemPowerState proc
			mov r10, rcx
			mov eax, 421
			syscall
			ret
NtSetSystemPowerState endp

NtSetSystemTime proc
			mov r10, rcx
			mov eax, 422
			syscall
			ret
NtSetSystemTime endp

NtSetThreadExecutionState proc
			mov r10, rcx
			mov eax, 423
			syscall
			ret
NtSetThreadExecutionState endp

NtSetTimer proc
			mov r10, rcx
			mov eax, 98
			syscall
			ret
NtSetTimer endp

NtSetTimer2 proc
			mov r10, rcx
			mov eax, 424
			syscall
			ret
NtSetTimer2 endp

NtSetTimerEx proc
			mov r10, rcx
			mov eax, 425
			syscall
			ret
NtSetTimerEx endp

NtSetTimerResolution proc
			mov r10, rcx
			mov eax, 426
			syscall
			ret
NtSetTimerResolution endp

NtSetUuidSeed proc
			mov r10, rcx
			mov eax, 427
			syscall
			ret
NtSetUuidSeed endp

NtSetValueKey proc
			mov r10, rcx
			mov eax, 96
			syscall
			ret
NtSetValueKey endp

NtSetVolumeInformationFile proc
			mov r10, rcx
			mov eax, 428
			syscall
			ret
NtSetVolumeInformationFile endp

NtSetWnfProcessNotificationEvent proc
			mov r10, rcx
			mov eax, 429
			syscall
			ret
NtSetWnfProcessNotificationEvent endp

NtShutdownSystem proc
			mov r10, rcx
			mov eax, 430
			syscall
			ret
NtShutdownSystem endp

NtShutdownWorkerFactory proc
			mov r10, rcx
			mov eax, 431
			syscall
			ret
NtShutdownWorkerFactory endp

NtSignalAndWaitForSingleObject proc
			mov r10, rcx
			mov eax, 432
			syscall
			ret
NtSignalAndWaitForSingleObject endp

NtSinglePhaseReject proc
			mov r10, rcx
			mov eax, 433
			syscall
			ret
NtSinglePhaseReject endp

NtStartProfile proc
			mov r10, rcx
			mov eax, 434
			syscall
			ret
NtStartProfile endp

NtStopProfile proc
			mov r10, rcx
			mov eax, 435
			syscall
			ret
NtStopProfile endp

NtSubscribeWnfStateChange proc
			mov r10, rcx
			mov eax, 436
			syscall
			ret
NtSubscribeWnfStateChange endp

NtSuspendProcess proc
			mov r10, rcx
			mov eax, 437
			syscall
			ret
NtSuspendProcess endp

NtSuspendThread proc
			mov r10, rcx
			mov eax, 438
			syscall
			ret
NtSuspendThread endp

NtSystemDebugControl proc
			mov r10, rcx
			mov eax, 439
			syscall
			ret
NtSystemDebugControl endp

NtTerminateEnclave proc
			mov r10, rcx
			mov eax, 440
			syscall
			ret
NtTerminateEnclave endp

NtTerminateJobObject proc
			mov r10, rcx
			mov eax, 441
			syscall
			ret
NtTerminateJobObject endp

NtTerminateProcess proc
			mov r10, rcx
			mov eax, 44
			syscall
			ret
NtTerminateProcess endp

NtTerminateThread proc
			mov r10, rcx
			mov eax, 83
			syscall
			ret
NtTerminateThread endp

NtTestAlert proc
			mov r10, rcx
			mov eax, 442
			syscall
			ret
NtTestAlert endp

NtThawRegistry proc
			mov r10, rcx
			mov eax, 443
			syscall
			ret
NtThawRegistry endp

NtThawTransactions proc
			mov r10, rcx
			mov eax, 444
			syscall
			ret
NtThawTransactions endp

NtTraceControl proc
			mov r10, rcx
			mov eax, 445
			syscall
			ret
NtTraceControl endp

NtTraceEvent proc
			mov r10, rcx
			mov eax, 94
			syscall
			ret
NtTraceEvent endp

NtTranslateFilePath proc
			mov r10, rcx
			mov eax, 446
			syscall
			ret
NtTranslateFilePath endp

NtUmsThreadYield proc
			mov r10, rcx
			mov eax, 447
			syscall
			ret
NtUmsThreadYield endp

NtUnloadDriver proc
			mov r10, rcx
			mov eax, 448
			syscall
			ret
NtUnloadDriver endp

NtUnloadKey proc
			mov r10, rcx
			mov eax, 449
			syscall
			ret
NtUnloadKey endp

NtUnloadKey2 proc
			mov r10, rcx
			mov eax, 450
			syscall
			ret
NtUnloadKey2 endp

NtUnloadKeyEx proc
			mov r10, rcx
			mov eax, 451
			syscall
			ret
NtUnloadKeyEx endp

NtUnlockFile proc
			mov r10, rcx
			mov eax, 452
			syscall
			ret
NtUnlockFile endp

NtUnlockVirtualMemory proc
			mov r10, rcx
			mov eax, 453
			syscall
			ret
NtUnlockVirtualMemory endp

NtUnmapViewOfSection proc
			mov r10, rcx
			mov eax, 42
			syscall
			ret
NtUnmapViewOfSection endp

NtUnmapViewOfSectionEx proc
			mov r10, rcx
			mov eax, 454
			syscall
			ret
NtUnmapViewOfSectionEx endp

NtUnsubscribeWnfStateChange proc
			mov r10, rcx
			mov eax, 455
			syscall
			ret
NtUnsubscribeWnfStateChange endp

NtUpdateWnfStateData proc
			mov r10, rcx
			mov eax, 456
			syscall
			ret
NtUpdateWnfStateData endp

NtVdmControl proc
			mov r10, rcx
			mov eax, 457
			syscall
			ret
NtVdmControl endp

NtWaitForAlertByThreadId proc
			mov r10, rcx
			mov eax, 458
			syscall
			ret
NtWaitForAlertByThreadId endp

NtWaitForDebugEvent proc
			mov r10, rcx
			mov eax, 459
			syscall
			ret
NtWaitForDebugEvent endp

NtWaitForKeyedEvent proc
			mov r10, rcx
			mov eax, 460
			syscall
			ret
NtWaitForKeyedEvent endp

NtWaitForMultipleObjects proc
			mov r10, rcx
			mov eax, 91
			syscall
			ret
NtWaitForMultipleObjects endp

NtWaitForMultipleObjects32 proc
			mov r10, rcx
			mov eax, 26
			syscall
			ret
NtWaitForMultipleObjects32 endp

NtWaitForSingleObject proc
			mov r10, rcx
			mov eax, 4
			syscall
			ret
NtWaitForSingleObject endp

NtWaitForWorkViaWorkerFactory proc
			mov r10, rcx
			mov eax, 461
			syscall
			ret
NtWaitForWorkViaWorkerFactory endp

NtWaitHighEventPair proc
			mov r10, rcx
			mov eax, 462
			syscall
			ret
NtWaitHighEventPair endp

NtWaitLowEventPair proc
			mov r10, rcx
			mov eax, 463
			syscall
			ret
NtWaitLowEventPair endp

NtWorkerFactoryWorkerReady proc
			mov r10, rcx
			mov eax, 1
			syscall
			ret
NtWorkerFactoryWorkerReady endp

NtWriteFile proc
			mov r10, rcx
			mov eax, 8
			syscall
			ret
NtWriteFile endp

NtWriteFileGather proc
			mov r10, rcx
			mov eax, 27
			syscall
			ret
NtWriteFileGather endp

NtWriteRequestData proc
			mov r10, rcx
			mov eax, 87
			syscall
			ret
NtWriteRequestData endp

NtWriteVirtualMemory proc
			mov r10, rcx
			mov eax, 58
			syscall
			ret
NtWriteVirtualMemory endp

NtYieldExecution proc
			mov r10, rcx
			mov eax, 70
			syscall
			ret
NtYieldExecution endp

end
