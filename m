Return-Path: <linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] ARM64: dts: meson-gx: Add MALI nodes for GXBB and
 GXL
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
References: <1488365164-22861-1-git-send-email-narmstrong@baylibre.com>
 <1488365164-22861-4-git-send-email-narmstrong@baylibre.com>
 <e26cf584-dab2-2702-f7e6-b28f750fa00c@suse.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <e80d9fb0-1d71-7cab-5e32-72316474fdfc@baylibre.com>
Date: Thu, 2 Mar 2017 13:47:26 +0100
MIME-Version: 1.0
In-Reply-To: <e26cf584-dab2-2702-f7e6-b28f750fa00c@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, carlo@caione.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="windows-1252"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Hi Andreas,
On 03/02/2017 01:31 PM, Andreas F=E4rber wrote:
> Hi Neil,
> =

> Am 01.03.2017 um 11:46 schrieb Neil Armstrong:
>> The same MALI-450 MP3 GPU is present in the GXBB and GXL SoCs.
> =

> First of all, any reason you're upper-casing Mali in the commit message?
> ARM doesn't.

No reason, only a type, indeed it was lower-casing on the v1.
Will fix in v2.

> =

>>
>> The node is simply added in the meson-gxbb.dtsi file.
> =

> The GXBB part looks fine on a quick look.
> =

>>
>> For GXL, since a lot is shared with the GXM that has a MALI-T820 IP, this
>> patch adds a new meson-gxl-mali.dtsi and is included in the SoC specific
>> dtsi files.
> =

> This part is slightly confusing though.
> =

> What exactly is the GXL vs. GXM difference that this can't be handled by
> overriding node properties compatible/interrupts/clocks? I am missing a
> GXM patch in this series as rationale for doing it this way.
> =

> In particular I am wondering whether the whole GXM-inherits-from-GXL
> concept is flawed and should be adjusted if this leads to secondary
> .dtsi files like this: My proposal would be to instead create a
> meson-gxl-gxm.dtsi, that meson-gxl.dtsi and meson-gxm.dtsi can inherit
> the current common parts from, then the Mali bits can simply go into
> meson-gxl.dtsi without extra #includes needed in S905X and S905D. While
> it's slightly more work to split once again, I think it would be cleaner.

The GXL and GXM differences are very small :
 - They share the same clock tree
 - They share the same pinctrl and even the same pinout (S905D and S912 are=
 pin-to-pin compatible)
 - They share all the peripherals

The only changes are :
 - Enhanced video encoding and decoding support, this will need a family-sp=
ecific compatible when pushed
 - Slightly differences in the Video Processing Unit, this is why I introdu=
ced family-specific compatibles
 - A secondary Cortex-A53 cluster
 - A secondary SCPI cpufreq clock entry
 - A different Mali core, but with the same interrupts (less but they share=
 the same lower interrupts), clocks and memory space

This is why it was decided to have a sub-dtsi, having a secondary dtsi will=
 simply copy 99% of the GXL dtsi,
but surely we could also have an intermediate dtsi but for boards I'm ok wi=
th it, but less for a SoC dtsi,
since it could lead to some confusion.

Finally, yes I could have added the mali node to the GXL dtsi, but the midg=
ard Mali dt-bindings are not upstream
and the family is too big and recent enough to consider having stable bindi=
ngs for now.

Nevertheless, nothing is final, this gxl-mali.dtsi could be merged into the=
 GXL dtsi in the future when we
have proper dt-bindings and a real support of the T820 Mali on the S912.

Kevin, what's your thought about this ?

Neil

> Regards,
> Andreas
> =

>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi      | 37 +++++++++++++++++=
+++
>>  arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi  | 43 +++++++++++++++++=
+++++++
>>  arch/arm64/boot/dts/amlogic/meson-gxl-s905d.dtsi |  1 +
>>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi |  1 +
>>  4 files changed, 82 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
> [...]
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d.dtsi b/arch/arm=
64/boot/dts/amlogic/meson-gxl-s905d.dtsi
>> index 615308e..5a90e30 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d.dtsi
>> @@ -42,6 +42,7 @@
>>   */
>>  =

>>  #include "meson-gxl.dtsi"
>> +#include "meson-gxl-mali.dtsi"
>>  =

>>  / {
>>  	compatible =3D "amlogic,s905d", "amlogic,meson-gxl";
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi b/arch/arm=
64/boot/dts/amlogic/meson-gxl-s905x.dtsi
>> index 08237ee..0f78d83 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi
>> @@ -42,6 +42,7 @@
>>   */
>>  =

>>  #include "meson-gxl.dtsi"
>> +#include "meson-gxl-mali.dtsi"
>>  =

>>  / {
>>  	compatible =3D "amlogic,s905x", "amlogic,meson-gxl";
> =



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
