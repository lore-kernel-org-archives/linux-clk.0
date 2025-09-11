Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ACF27F017
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757576595; cv=none; b=e4x6pK8Bw4DMTzaWNQ7BHpry1orDON9Hult3tLTqRvVcO9jfoljgqlRRFV/7VrRUxpbXcSx4HQlyN4HAYI+tgIiEJGni6hD4LgqaKQ9jqpc5beZy8kjesXbNVLC/8N6wJ5HB9vpQypKo+09PwY5ZIk7zOanpLS2j0yTuyBG/EV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757576595; c=relaxed/simple;
	bh=A5WSBeY7ArHbEttNrSD9TcclLr6jrbhQ9nT8KwBqsfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aSl9w9OcZk531oSDe5BAylrvZ9lgwG8qraYG7iTk5jhWlj/nleNYPyvur4hy55vABZlFfSSNy4Swl1CWBQR7AKysM41fCND3If75TzD1mujLSAqgKikL1WgZ6oVWlTXaILmrAx1GVmIFPdnePbTRFVHUrmMW3mUXoVxkL0kughg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ds0vUgSm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ds0vUgSm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45cb659e858so2790815e9.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 00:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757576590; x=1758181390; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ocLM34GOeUaGdAHS29toK+EluWRUE1MXFa3Amqck7do=;
        b=ds0vUgSmHs537ye7CwEqguVfQ6CpvkOsA58VpwfokPwncHf+bycYd8ZN/IGOoPRsx5
         ityFONvprBv0+FxTP8JOVQNsiQ3z7Nd813Ui6IyYEbxOO5wze+Q+sHZ7B9V7fb47Uy5S
         YAz70UGQY8DI29X7stG0u4IeWy+LZxXGtSpaVoFcVUnJyzQp1lkeT8A5ildhndX92MEO
         JFLeehT5kENyjOY5vLqIVggFhLbImajNOjqYs2e8VSEjLdj+5xt46x5vX4Y/sKy6TWSf
         87yJpaY0iFtGLzbGO4gObPGOLw+vfMjiCprriFB2iIU3byY9RDYIYFUXlcX5fnXjVPOg
         2zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576590; x=1758181390;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocLM34GOeUaGdAHS29toK+EluWRUE1MXFa3Amqck7do=;
        b=gW+y/ilAz0upP06qNhRHe7nQZCzgCrPRpuVrEgIIUD9sFfGZtSvQYAFLWQydSWcQVr
         yi4ecPBXbzqtLV+AmMBjdwkJ+W2V05sKejZkJtMEo2WdMZpwut4Bl2APhEzULCrpNXz1
         +HhdnTwEaH6zJZWDRHzSOnZugtW89H4TsdEsBeNav9ld5w3qB2oQU3lBi4Hi018qfQQ+
         Z0lea2qL0JEZgmTKk60Pl+rq1jNLVI3unHlMX2Gz9D+wPxIavW1IGeaP9hJXk5cH3bFL
         ft6aVT59eRYtpY4xDFj6FPjW+lyD9sxBadwro4E/6cXMp5JeVHmeJa99gLHLFwP1vdwd
         xvPA==
X-Forwarded-Encrypted: i=1; AJvYcCVqIonfap31AXjI3HGAZTAzvvThD8MhNUY6M3igcDg4Z8K/f9y5NlEPas3Hb33UTWlXpEq1A2SvOo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGgE/6GpwutkWcdII/cO5Z0Xzwgdj2A4GYq+GAzTLql9KFv2g3
	A8dLhEw3se0Nh9Y/+q7gkl1RN3qiBoaYnL+/WLRwZLV1Mze3ZNtN5HGVmICmZoo9yz4=
X-Gm-Gg: ASbGncsWPtQh+iOVrrIIyS5Z1F/7UmV1E87NAzsEx/h0E+PmwpeNSTrIPLGKIzUFhye
	8shD82QBUxZsJkvofLqAzzXa3TQl/Tk8hHHjJKnNBrZLF71dW6Uf+D00Wi7XGUrJFZuCX70CmZj
	pwnv1zNkvsaXfRE1yrf0ib8Ljki6GQnrYmD1GFHU42xMqJvc5c5UKJdwm4I3o5awdR/btkoPMKx
	pH0meg8xpG0D9yc3xbS8nN2edKO1mArOa3IR08zZJOOQKBgYYGEmR61/I+/2ny+aYv92G0rGyw6
	zjZGz7KPBBiFKKAEC7l02+Wlp+KuwIr8rHj0PyqfiBM5XA4bZjzj4opmbdnXFHQKxKNtTioDYm5
	vcFavOihGXBAG5XDlP+Ikg7sZ74H97CSMZAD5YmNizpM=
X-Google-Smtp-Source: AGHT+IFziZg7v6LlC8m6JnaXV3d4ooVHtsdQLQH89zmhgGaJ+ZtkJo/Vd2456C3nvJ69B6Gcl/m45w==
X-Received: by 2002:a05:600c:1e21:b0:45c:a955:4578 with SMTP id 5b1f17b1804b1-45dde02878emr152916345e9.21.1757576589973;
        Thu, 11 Sep 2025 00:43:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:205f:d6d3:fd4a:adb5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e0156d206sm16554135e9.5.2025.09.11.00.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 00:43:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: add video-related clocks for S4 SoC
In-Reply-To: <28399ab7-2560-482a-be7b-c83d631ac351@amlogic.com> (Chuan Liu's
	message of "Thu, 11 Sep 2025 10:01:03 +0800")
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
	<20250909-add_video_clk-v4-2-5e0c01d47aa8@amlogic.com>
	<1jv7lqiqzg.fsf@starbuckisacylon.baylibre.com>
	<28399ab7-2560-482a-be7b-c83d631ac351@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Sep 2025 09:43:08 +0200
Message-ID: <1jplbxigdv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 11 Sep 2025 at 10:01, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome:
>
>
> On 9/10/2025 5:41 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 09 Sep 2025 at 15:29, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> Add video encoder, demodulator and CVBS clocks.
>>>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/s4-peripherals.c | 203 +++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 203 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
>>> index 6d69b132d1e1..b855e8f1fc04 100644
>>> --- a/drivers/clk/meson/s4-peripherals.c
>>> +++ b/drivers/clk/meson/s4-peripherals.c
>>> @@ -44,6 +44,7 @@
>>>   #define CLKCTRL_VDIN_MEAS_CLK_CTRL                 0x0f8
>>>   #define CLKCTRL_VAPBCLK_CTRL                       0x0fc
>>>   #define CLKCTRL_HDCP22_CTRL                        0x100
>>> +#define CLKCTRL_CDAC_CLK_CTRL                      0x108
>>>   #define CLKCTRL_VDEC_CLK_CTRL                      0x140
>>>   #define CLKCTRL_VDEC2_CLK_CTRL                     0x144
>>>   #define CLKCTRL_VDEC3_CLK_CTRL                     0x148
>>> @@ -1126,6 +1127,22 @@ static struct clk_regmap s4_cts_encp_sel = {
>>>        },
>>>   };
>>>
>>> +static struct clk_regmap s4_cts_encl_sel = {
>>> +     .data = &(struct clk_regmap_mux_data){
>>> +             .offset = CLKCTRL_VIID_CLK_DIV,
>>> +             .mask = 0xf,
>>> +             .shift = 12,
>>> +             .table = s4_cts_parents_val_table,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "cts_encl_sel",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_hws = s4_cts_parents,
>>> +             .num_parents = ARRAY_SIZE(s4_cts_parents),
>>> +             .flags = CLK_SET_RATE_PARENT,
>> Do you really expect the rate of the parents to be adjusted when calling
>> set_rate() on this clock ?
>>
>> It all trickle down to vclks which are shared with enci encp and vdac
>> clocks, so maybe not such a good idea, don't you think ?
>
>
> Thanks for pointing this out. You're right, this flag doesn't belong
> here.

Ok, let's be consistent then. Please add another change to drop the flag
from the other video clocks, such as enci, encp, etc . Thx.

>
> I'll drop it in the next revision. If there are no further objections
> on other aspects, I'll prepare a v5 series that also includes Conor's
> Acked-by that I missed...
>
>
>>> +     },
>>> +};
>>> +
>>>   static struct clk_regmap s4_cts_vdac_sel = {
>>>        .data = &(struct clk_regmap_mux_data){
>>>                .offset = CLKCTRL_VIID_CLK_DIV,
>>> @@ -1205,6 +1222,22 @@ static struct clk_regmap s4_cts_encp = {
>>>        },
>>>   };
>>>
>>> +static struct clk_regmap s4_cts_encl = {
>>> +     .data = &(struct clk_regmap_gate_data){
>>> +             .offset = CLKCTRL_VID_CLK_CTRL2,
>>> +             .bit_idx = 3,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "cts_encl",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_cts_encl_sel.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>>   static struct clk_regmap s4_cts_vdac = {
>>>        .data = &(struct clk_regmap_gate_data){
>>>                .offset = CLKCTRL_VID_CLK_CTRL2,
>>> @@ -2735,6 +2768,165 @@ static struct clk_regmap s4_gen_clk = {
>>>        },
>>>   };
>>>
>>> +/* CVBS DAC */
>>> +static struct clk_regmap s4_cdac_sel = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = CLKCTRL_CDAC_CLK_CTRL,
>>> +             .mask = 0x3,
>>> +             .shift = 16,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "cdac_sel",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = (const struct clk_parent_data []) {
>>> +                     { .fw_name = "xtal", },
>>> +                     { .fw_name = "fclk_div5" },
>>> +             },
>>> +             .num_parents = 2,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_cdac_div = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = CLKCTRL_CDAC_CLK_CTRL,
>>> +             .shift = 0,
>>> +             .width = 16,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "cdac_div",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_cdac_sel.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_cdac = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = CLKCTRL_CDAC_CLK_CTRL,
>>> +             .bit_idx = 20,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "cdac",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_cdac_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_demod_core_sel = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .mask = 0x3,
>>> +             .shift = 9,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "demod_core_sel",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = (const struct clk_parent_data []) {
>>> +                     { .fw_name = "xtal" },
>>> +                     { .fw_name = "fclk_div7" },
>>> +                     { .fw_name = "fclk_div4" }
>>> +             },
>>> +             .num_parents = 3,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_demod_core_div = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .shift = 0,
>>> +             .width = 7,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "demod_core_div",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_demod_core_sel.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_demod_core = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .bit_idx = 8
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "demod_core",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_demod_core_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +/* CVBS ADC */
>>> +static struct clk_regmap s4_adc_extclk_in_sel = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .mask = 0x7,
>>> +             .shift = 25,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "adc_extclk_in_sel",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = (const struct clk_parent_data []) {
>>> +                     { .fw_name = "xtal" },
>>> +                     { .fw_name = "fclk_div4" },
>>> +                     { .fw_name = "fclk_div3" },
>>> +                     { .fw_name = "fclk_div5" },
>>> +                     { .fw_name = "fclk_div7" },
>>> +                     { .fw_name = "mpll2" },
>>> +                     { .fw_name = "gp0_pll" },
>>> +                     { .fw_name = "hifi_pll" }
>>> +             },
>>> +             .num_parents = 8,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_adc_extclk_in_div = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .shift = 16,
>>> +             .width = 7,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "adc_extclk_in_div",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_adc_extclk_in_sel.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_adc_extclk_in = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .bit_idx = 24
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "adc_extclk_in",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_adc_extclk_in_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>>   static const struct clk_parent_data s4_pclk_parents = { .hw = &s4_sys_clk.hw };
>>>
>>>   #define S4_PCLK(_name, _reg, _bit, _flags) \
>>> @@ -3028,6 +3220,17 @@ static struct clk_hw *s4_peripherals_hw_clks[] = {
>>>        [CLKID_HDCP22_SKPCLK_SEL]       = &s4_hdcp22_skpclk_sel.hw,
>>>        [CLKID_HDCP22_SKPCLK_DIV]       = &s4_hdcp22_skpclk_div.hw,
>>>        [CLKID_HDCP22_SKPCLK]           = &s4_hdcp22_skpclk.hw,
>>> +     [CLKID_CTS_ENCL_SEL]            = &s4_cts_encl_sel.hw,
>>> +     [CLKID_CTS_ENCL]                = &s4_cts_encl.hw,
>>> +     [CLKID_CDAC_SEL]                = &s4_cdac_sel.hw,
>>> +     [CLKID_CDAC_DIV]                = &s4_cdac_div.hw,
>>> +     [CLKID_CDAC]                    = &s4_cdac.hw,
>>> +     [CLKID_DEMOD_CORE_SEL]          = &s4_demod_core_sel.hw,
>>> +     [CLKID_DEMOD_CORE_DIV]          = &s4_demod_core_div.hw,
>>> +     [CLKID_DEMOD_CORE]              = &s4_demod_core.hw,
>>> +     [CLKID_ADC_EXTCLK_IN_SEL]       = &s4_adc_extclk_in_sel.hw,
>>> +     [CLKID_ADC_EXTCLK_IN_DIV]       = &s4_adc_extclk_in_div.hw,
>>> +     [CLKID_ADC_EXTCLK_IN]           = &s4_adc_extclk_in.hw,
>>>   };
>>>
>>>   static const struct meson_clkc_data s4_peripherals_clkc_data = {
>> --
>> Jerome

-- 
Jerome
