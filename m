Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:39496 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbeCTCYN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Mar 2018 22:24:13 -0400
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: assign clock rate for some
 cpll child clock
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: dbasehore@chromium.org, heiko@sntech.de, briannorris@chromium.org,
        dianders@chromium.org, linux-rockchip@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <1521511589-17844-1-git-send-email-hl@rock-chips.com>
 <1521511589-17844-2-git-send-email-hl@rock-chips.com>
 <13843114-3db5-b98c-a71d-c61911a8a42c@rock-chips.com>
From: hl <hl@rock-chips.com>
Message-ID: <d92aa74d-7a49-8fbd-5efc-b931210ef0b7@rock-chips.com>
Date: Tue, 20 Mar 2018 10:23:41 +0800
MIME-Version: 1.0
In-Reply-To: <13843114-3db5-b98c-a71d-c61911a8a42c@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On Tuesday, March 20, 2018 10:12 AM, Shawn Lin wrote:
> On 2018/3/20 10:06, Lin Huang wrote:
>> These clocks do not assign default clock frequency, and use the
>> default cru register value to get frequency, so if cpll increase
>> frequency, these clocks also increase their frequency, that may
>> exceed their signed off frequency. So assign default clock for
>> them to avoid it.
>>
>> NOTE: on none of the boards currently in mainline do we expect
>> CPLL to be anything other than 800 MHz, but some future boards
>> might have it. It's still good to be explicit about the clock
>> rates to make diffing against future boards easier and also to
>> rely less on BIOS muxing.
>>
>> Change-Id: If79368aeda5c51dbf2a3b6659f17052a2ae4a401
>
> Should remove Change-Id for future patch(es), thought Heiko may help
> do it when applied.
>
Opp, sorry for that.
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
>
>> Signed-off-by: Lin Huang <hl@rock-chips.com>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> ---
>> Changes in v2:
>> - None
>> Changes in v3:
>> - Update commit message
>>
>>   arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi |  8 +++++++-
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi     | 14 ++++++++++++--
>>   2 files changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
>> index 18f546f..84e367b 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
>> @@ -588,7 +588,10 @@
>>           <&cru ACLK_PERILP0>, <&cru HCLK_PERILP0>,
>>           <&cru PCLK_PERILP0>, <&cru ACLK_CCI>,
>>           <&cru HCLK_PERILP1>, <&cru PCLK_PERILP1>,
>> -        <&cru ACLK_VIO>;
>> +        <&cru ACLK_VIO>,
>> +        <&cru ACLK_GIC_PRE>,
>> +        <&cru PCLK_DDR>,
>> +        <&cru ACLK_HDCP>;
>>       assigned-clock-rates =
>>           <600000000>, <800000000>,
>>           <1000000000>,
>> @@ -597,6 +600,9 @@
>>           <100000000>, <100000000>,
>>           <50000000>, <800000000>,
>>           <100000000>, <50000000>,
>> +        <400000000>,
>> +        <200000000>,
>> +        <200000000>,
>>           <400000000>;
>>   };
>>   diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index 4550c0f..b358533 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -315,6 +315,8 @@
>>           clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
>>                <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
>>           clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>> +        assigned-clocks = <&cru HCLK_SD>;
>> +        assigned-clock-rates = <200000000>;
>>           fifo-depth = <0x100>;
>>           power-domains = <&power RK3399_PD_SD>;
>>           resets = <&cru SRST_SDMMC>;
>> @@ -466,8 +468,10 @@
>>           clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
>>                <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
>>           clock-names = "core-clk", "pclk", "spdif", "grf";
>> -        phys = <&tcphy0_dp>, <&tcphy1_dp>;
>> +        assigned-clocks = <&cru SCLK_DP_CORE>, <&cru 
>> SCLK_SPDIF_REC_DPTX>;
>> +        assigned-clock-rates = <100000000>, <200000000>;
>>           power-domains = <&power RK3399_PD_HDCP>;
>> +        phys = <&tcphy0_dp>, <&tcphy1_dp>;
>>           resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
>>                <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
>>           reset-names = "spdif", "dptx", "apb", "core";
>> @@ -1323,7 +1327,10 @@
>>               <&cru ACLK_PERILP0>, <&cru HCLK_PERILP0>,
>>               <&cru PCLK_PERILP0>, <&cru ACLK_CCI>,
>>               <&cru HCLK_PERILP1>, <&cru PCLK_PERILP1>,
>> -            <&cru ACLK_VIO>;
>> +            <&cru ACLK_VIO>,
>> +            <&cru ACLK_GIC_PRE>,
>> +            <&cru PCLK_DDR>,
>> +            <&cru ACLK_HDCP>;
>>           assigned-clock-rates =
>>                <594000000>,  <800000000>,
>>               <1000000000>,
>> @@ -1332,6 +1339,9 @@
>>                <100000000>,  <100000000>,
>>                 <50000000>, <600000000>,
>>                <100000000>,   <50000000>,
>> +             <400000000>,
>> +             <200000000>,
>> +             <200000000>,
>>                <400000000>;
>>       };
>>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
>


