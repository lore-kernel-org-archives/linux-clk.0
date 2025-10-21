Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9DD2D6E67
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056704; cv=none; b=ktRrd7yC9Ee9hBHQn/mUOtuOSjg3Aqe+blRbl0OX5fZ4bUF0WjslqX2WAXvClEqjLD6mftRdjXrPymdDD8bmf4QQI+LBq1lDn9C3IF1WWWw8FtZx7rz+7VkYstP6uKgc6dPD0VXP7C8ley8yH1RboFHzdq5afxDL1jtAAqUMXzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056704; c=relaxed/simple;
	bh=ePnTqcsi+LRujOPSNyRV/6QAM93Sn7upy/IagZIVJrE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sgt8Lo05DXpYp5yvmg9BV2rH6lfGMb1IIZcz9VLAfUlNnVOjkYH2Zzah3PCkHqwuO3wQ1GDfCh4nVRqDl/5ZCXqdiGojX9UBvah7agINjP/7tpt8bexgKaEy3mORw3k3tZybJg3a23n5/cpk0r7tjOD927kBVGLU4wt8PnkkfqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=s4+73RCR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="s4+73RCR"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3c2db014easo1247081466b.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761056699; x=1761661499; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1WyHXr/eyRqrbObxdSXrtwAmI9rbqGkPfkhsgs81ls=;
        b=s4+73RCRrWdL/ZJApbsT6bFUejx3J3HcfFJUfkYwVKpMTBfgJeHZXLV9Vy1pXWQgRO
         ct/+xi3dBLqr1vxdqFdPvv+dwFvE9Nvz1O0VRmL3LHCOAJjqFMSJNwA3qvlmS6aFQ5gK
         YSspiVFJxrUUH+1KLBYLZcl8fL9jljJewwCNyb8FM3xOSIftwCKgpScbnVoUMsZ7OfRo
         jwv/vPXfcWW7Vvl9q8myFD5YKtMJ59xcaGKY5Stte2dRrCbR3b8g+YROfbJm2jdX62xi
         EfOG/Gp0pKT+2cXE1bk+mKSgJJTETn3v2uxJWhhphktwFJUtz5lLE1uWPHtNs+LFQ0sG
         M7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761056699; x=1761661499;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1WyHXr/eyRqrbObxdSXrtwAmI9rbqGkPfkhsgs81ls=;
        b=h2zcozd3NiN8FcxHfIjD3B90wKimLjL2YpAyuQ8Fz+l8gVrp1toPrxNRQFmCYc/AXr
         BnuONhz1o7qI8BtXjcxH0QQrkxakoI2jDlJl2zwUHW4OjFQ2TVICY86QDVxPAumPJgVQ
         uL2MTneA43eD5+W7CQP4e0ZD8z1gutXNo5EHG6i3aljsARud6vB/+NV+Vvlok0fom8fP
         UIwz+5oKDH5XJusHJcZhe7KZDrm3vmz4W84JvqiBo9EdNmiqRGQ/sFrnvPJCkEdcLpQO
         4bIDGhJ4fSJObbvtn2Perjefij9punw2fi+zI38CfRKkKt5PZtba6htsGSVEw+PippNi
         ydPA==
X-Forwarded-Encrypted: i=1; AJvYcCXqA8cCBV5wDA50qQnA1bo6bKF2yaQxJ94wpXQLLWW4Izb2TFnu6dmhX9C69YCF2eZvLgmd18FO68g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeOSALT6GfbrIgA8j5QNn71/7EuVTmRy4ypD8IavBa9b7SaxVg
	Rrg067Mmw2B1bhOLkdv8ysuQFUPvliB97aaaRzm03gjJ/axkdjD+cwAhyO3o8SwQvzM=
X-Gm-Gg: ASbGncuCbjYf+bRBtIGAjFCs1LK6D+Va+su0CBtUOfaIpDTPgOwBy/rHNBrJc5lolol
	4gFP1aDhH0aqgf35qItFOoJSI8BAu7J+MBABXlWuHdySiJ4d6izHU3rfjhoikHLs1OFcjSpfQ/w
	lhpv9pACgfVHl1X60xxewyibdDVC1yO+J4jBnEL79Solm928OAWipDyXIhxEp0gXiHqbvFzXHxV
	osgsHlekz8GlGfXklUOavLwYXg34kElVe36wQj4w/vW9PaFSph/tQmDKUmYefcxRH8tfIN9ebiu
	k4UQeBr0W2oOALBKFeAXdi6+K329kZpXWwsINl/9AxMUiCO+4IHgW8lRawrnjYNucc+z+4ang4B
	v5ZeF88oW0ZYqYUZ6p3rJeva9XlJx0/NDr9rhrvKFfa1qkV6gjp1tfNV1qkJjTrlVYB6HDB39Hd
	Qg7chPvfQioVXKqRmuv1g6FHXDilZbZzlmBLL7Qp3vneUDD46tjMmUGIy+kH26q7d+5TPiSnK5L
	1T0SuEhrxo6/DMVGn7ymbGbeQ==
X-Google-Smtp-Source: AGHT+IGN0X72iZ/uaFC3lc/dWPSmP0zEnWLE/5oi/QxvD+hnnLPe3mmfMdan2K+lK4hSorY9nNdgNw==
X-Received: by 2002:a17:907:3e1c:b0:b3c:896:abf5 with SMTP id a640c23a62f3a-b6473144021mr2164787466b.25.1761056699095;
        Tue, 21 Oct 2025 07:24:59 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-4b34-6694-d9bd-5210.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4b34:6694:d9bd:5210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25c9sm1109196966b.11.2025.10.21.07.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 07:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 16:24:58 +0200
Message-Id: <DDO2HYG8H2XJ.1MZLPJH36PR85@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Jagadeesh
 Kona" <quic_jkona@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
 <3854e3a0-744c-4317-a6ed-e28edbabc4a3@linaro.org>
 <DDNWU7DVDGJJ.2K19P7FFZU272@fairphone.com>
 <dca13de5-b027-4938-a854-2538fce52b7c@oss.qualcomm.com>
In-Reply-To: <dca13de5-b027-4938-a854-2538fce52b7c@oss.qualcomm.com>

Hi Taniya,

On Tue Oct 21, 2025 at 1:12 PM CEST, Taniya Das wrote:
>
>
> On 10/21/2025 3:28 PM, Luca Weiss wrote:
>> Hi Vladimir,
>>=20
>> On Tue Oct 21, 2025 at 11:48 AM CEST, Vladimir Zapolskiy wrote:
>>> Hi Luca.
>>>
>>> On 10/17/25 17:05, Luca Weiss wrote:
>>>> Hi Taniya,
>>>>
>>>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>>>
>>>>>
>>>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>>>> Hi Taniya,
>>>>>>
>>>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>>>
>>>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wro=
te:
>>>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX p=
ower
>>>>>>>>>>> domains.
>>>>>>>>>>
>>>>>>>>>> Are those really required to access the registers of the cammcc?=
 Or is
>>>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applic=
able
>>>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>>>
>>>>>>>>> Due to the described problem I experience a fatal CPU stall on SM=
8550-QRD,
>>>>>>>>> not on any SM8450 or SM8650 powered board for instance, however i=
t does
>>>>>>>>> not exclude an option that the problem has to be fixed for other =
clock
>>>>>>>>> controllers, but it's Qualcomm to confirm any other touched platf=
orms,
>>>>>>>>
>>>>>>>> Please work with Taniya to identify used power domains.
>>>>>>>>
>>>>>>>
>>>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>>>
>>>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitr=
a)
>>>>>> need multiple power domains, or in general which clock controller us=
es
>>>>>> which power domain.
>>>>>>
>>>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>>>
>>>>>> That'd be highly appreciated since I've been hitting weird issues th=
ere
>>>>>> that could be explained by some missing power domains.
>>>>>>
>>>>>
>>>>> Hi Luca,
>>>>>
>>>>> The targets you mentioned does not have any have multiple rail
>>>>> dependency, but could you share the weird issues with respect to cloc=
k
>>>>> controller I can take a look.
>>>>
>>>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone =
4)
>>>> again, but again hitting some clock issues.
>>>>
>>>> For reference, I am testing with following change:
>>>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir=
.zapolskiy@linaro.org/
>>>>
>>>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera senso=
r
>>>> on this phone - results in following error.
>>>>
>>>> [    3.140232] ------------[ cut here ]------------
>>>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>>>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.=
c:87 clk_branch_toggle+0x170/0x190
>>>>
>>>> Checking the driver against downstream driver, it looks like the RCGs
>>>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>>>> downstream, but changing that doesn't really improve the situation, bu=
t
>>>> it does change the error message to this:
>>>>
>>>> [    2.933254] ------------[ cut here ]------------
>>>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuratio=
n.
>>>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:=
136 update_config+0xd4/0xe4
>>>>
>>>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK a=
s
>>>> iface clk, could something like this be missing on sm6350?
>>>>
>>>> I'd appreciate any help or tips for resolving this.
>>>>
>>>
>>> Recently one particular problem related to MCLK was identified by me on
>>> QRB5165/RB5, and it was reported to Bjorn over IRC, namely it's not pos=
sible
>>> to toggle MCLK clock enable/disable state, when TITAN GDSC power domain=
 is
>>> set off. I'm working on fixing the issue (a change under clk/qcom), sin=
ce
>>> it's of an importance for a customer as well.
>>>
>>> I can't be totally sure that it's right the same problem as the one rep=
orted
>>> by you above, but it looks very similar, as a fast workaround please co=
nsider
>>> to set an ALWAYS_ON flag of TITAN GDSC, and at least a report from you =
that
>>> this actually helps would be nice to get.
>>=20
>> Unfortunately that doesn't seem to help on sm6350.
>>=20
>> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm=
6350.c
>> index 12a469ce7e2f..cf87ad55d318 100644
>> --- a/drivers/clk/qcom/camcc-sm6350.c
>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>> @@ -1767,6 +1767,7 @@ static struct gdsc titan_top_gdsc =3D {
>>  		.name =3D "titan_top_gdsc",
>>  	},
>>  	.pwrsts =3D PWRSTS_OFF_ON,
>> +	.flags =3D ALWAYS_ON,
>>  };
>> =20
>>  static struct clk_hw *camcc_sm6350_hws[] =3D {
>>=20
>>=20
>> $ cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
>> [...]
>> titan_top_gdsc                  on                              0
>>                                                 bps_gdsc, ipe_0_gdsc, if=
e_0_gdsc, ife_1_gdsc, ife_2_gdsc
>>     ac4a000.cci                     suspended                   0       =
    SW
>>     ac4b000.cci                     suspended                   0       =
    SW
>>     genpd:3:acb3000.camss           suspended                   0       =
    SW
>> [...]
>>=20
>> but still the same clock stuck warning...
>>=20
>> [    3.093431] ------------[ cut here ]------------
>> [    3.094614] camcc_mclk1_clk status stuck at 'off'
>> [    3.094629] WARNING: CPU: 6 PID: 65 at drivers/clk/qcom/clk-branch.c:=
87 clk_branch_toggle+0x170/0x190
>>=20
>> Thanks for the suggestion though.
>>=20
>
> Hi Luca,
>
> Seems like the CAMCC_PLL2_OUT_EARLY output could be OFF here, which is
> sourcing the mclk RCG's.
>
> The user_ctl is not properly configured to enable the PLL early output.
> Can you please try below change and check if it helps?
>
> diff --git a/drivers/clk/qcom/camcc-sm6350.c
> b/drivers/clk/qcom/camcc-sm6350.c
> index 8aac97d29ce3..d33db530b7c9 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -154,6 +154,7 @@ static const struct alpha_pll_config
> camcc_pll2_config =3D {
>         .config_ctl_hi_val =3D 0x400003d2,
>         .test_ctl_val =3D 0x04000400,
>         .test_ctl_hi_val =3D 0x00004000,
> +       .user_ctl_val =3D 0x0000030F,
> };

Yes! Indeed that makes the clock not be stuck, and debugcc is also
correctly reporting ~24MHz from that clock when it's enabled!

  cam_cc_mclk1_clk: 23.999592MHz (23999592Hz)

Is this PLL also missing a value for .user_ctl_hi_val? The other PLLs
have that set as well.

Out of curiousity, where's this magic value from? Only some sort of HPG
doc, or is this also somewhere referenced in downstream? Curious why
this is not set there for this PLL.

This is one major step toward camss & camera support for this phone!

Regards
Luca
