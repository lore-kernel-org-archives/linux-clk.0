Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD23ECBCF
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 11:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472615; cv=none; b=U6SHxYEEVHyetA4Sq2kZX1Mv+Pk5SjwJ8DWZElcMox0jhg7vJk7MXo/1/LZVEYezKoFrqLEVHlbhcGYX8bsooAmDINjP+4v9rOfuwY8CuAh2ZCs83zJJgKgj1ZS2i8j6Gqx2nruHb6q4uQAcBhlA0E4MZlqwH+i/p02Cn9TQ1IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472615; c=relaxed/simple;
	bh=WSyro5cp3FqXrJe9SUXnePJYJRbQ0+qoWkp0+F9Ep5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qsg21FVDnrLAL2NqvQSXyEgRo8p0hvsF7a2A0WxsRx19MTdj9LTmdqRj4KAG5XDw6/3cZmFYtozUTA7sT5qC4auwrz38s4CUEpSh7LDb5EKdBX3dlUIC+u4D+qPE4qHfKYo5bw/nZrh62jZQ0XpxQI6VlJyZDr1uv6KYpfWDI/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWTKILoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/X0uxz2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWTKILoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/X0uxz2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcnl1881536
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 11:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKwx830Tn5+ykf9/w29CwgY3uz1mJmC+sgylDuqgczk=; b=TWTKILoPMmRPok9c
	F7uYCz75HQWiGueItY2WB93D36uyexEUi7UEBnG6HhKFC2Wl7oCbnUUXQNLd1o7O
	zSl8a4m3RO5E6pn/agbnNUmj4K8e2TDL+X2WY6eDnUzEMSJfmq2Eix92gYDJ+Tw7
	KU88+Ms00WiZC/8CRRSQwiXOJbKZV65QH6yiLSrLMNR3A+sLI3LiO1I66gJQ8Z4m
	qZozbIkCqgtsYxFw+2hlgA29DxLq+lL5iX7xZaZymQk7C8Md7Dv7FbMzQmWjwtud
	krF6sr2eGhG3/UBgUMLJCcNtVVRNunLY5Ms4ELspa4+PjNQAdUb40CQsFP2pjPPA
	IBV+gg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeqae04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 11:16:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dd10a7e0ecso1933916d6.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472612; x=1783077412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKwx830Tn5+ykf9/w29CwgY3uz1mJmC+sgylDuqgczk=;
        b=b/X0uxz2tjV7uBSHDmVpAhmJnTE46DX6hb/VIBlqJ6fg8xXXRTSRqSgeFAydQ18Ig3
         nXP+wK7EBC+KBkpDhEOroaMDgXGDnwYFqBf9FHt6Fu49CMnoRgov3usNXCTmlgUhGsyt
         LGCdv/PtMeYQ42nYZgISl/qrZHVvyHnfpv3heBBFEfLwCeVKJ8HqT5g53Fi4d6c8BtGk
         uvI/XoCnWkHTyO+/3VinBU/PnDILv5pGvwdbvIy+fxSxMbFvw3mlrK4TfNghZSWXcR/m
         MeI8kfL7UYXnH1bHFzjSHJemh/Y2MYPxkNPReqwx/GqMsyZIAEDYnCoK/bI5AOZF25iS
         LrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472612; x=1783077412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKwx830Tn5+ykf9/w29CwgY3uz1mJmC+sgylDuqgczk=;
        b=oxLbRIb+Eo4iBZMR/xMiHypMZb6UhQCvEiE/thFdGcI8RUt0IKLK181w53Op8DisQi
         p6FCy06DklrKxkCPXRj0JTgBBZQBOcYJQ5siXJL4TjkSVAYvVac6IZZtOd4m+CmQlvlO
         7gUSkwnbzcSK4xo+J6+gWzeDJcXT6LdHTJjR3dler2m2S28xCkaQUSArFnkfTyY9rP1Y
         NqRfamkMY7iv6oXCJI/u7wPZASvrJXChpVuCa7fpwYv6JgQVl+0kOecvL0r5qq49yJpZ
         y4PPydLndk1fpDf13WosKceA8yEFr9fNzR8TFSoEFi3HWqXL8p00EFc0IUPs146n8dWs
         kdjg==
X-Forwarded-Encrypted: i=1; AFNElJ/zDHbnD/Jr6u5suHj/ieU6ym+dQzuxZ3+0/pEdDJjSQN2Y6xWeLn/7/4D7TV9XiFYeM2DBgZSm87U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1gh94cp50ZIXrk3W7mW7oOHeMXnUmloR2CQ7ng1QIEbLoxXP
	FsUu+1ymUkUI+ikf1krvThyTrlR/Xfk2tc4SIyeVdSo48FoYtDK26jIZ/dHTVAA/P1iJOh5j2ar
	46nRhqrTvaaYpijnMgWb7tzTCShVaNsw+gdcdxB75V++pQ0p2eX2C9MqtTLNT/lw=
X-Gm-Gg: AfdE7cnsw+6ZOt5FKK8vBI+G7wjtqXtTn/VkgOK26TgTg/IiLcxKWwI9sSoS6BFQURe
	jG/QSYnQesE777PFeZt86kkFBkh4ZXdLSmk3hULpbLp7Buxo685LziYmozid4QosZtgMbGORox3
	KcAUxFxZcJ6AYAIOgECyj+pUvmfZte56O48oHHUB8+3RpiCKnkriB8DFA98/88gaSyUQa3anskd
	WEA5KRDJeNi9VDtHF4jIG24FsC2ugp1zzGOrZqlMxUf41ijh54yNC4j4+TiQrRrTKM/xoErwfRT
	Z3CtWbFn4A1pamTnZC6Hxb1EV0d3zVecrhE7xcEoRllvlTk5Rb4/1T6h+mWExGTYu/vE1+Bxnxo
	ika3U/Frw/5tMjvY2ZhR9IRygyRHQKk8ZGfk=
X-Received: by 2002:a05:622a:1813:b0:50e:6311:7380 with SMTP id d75a77b69052e-51a72831d5cmr60918041cf.6.1782472612261;
        Fri, 26 Jun 2026 04:16:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:50e:6311:7380 with SMTP id d75a77b69052e-51a72831d5cmr60917751cf.6.1782472611865;
        Fri, 26 Jun 2026 04:16:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c121cd03f24sm113474366b.32.2026.06.26.04.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:16:51 -0700 (PDT)
Message-ID: <02d8b102-fd7f-49bb-bdbd-62419c54a836@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 13:16:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, usb4-upstream@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
 <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
 <c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
 <750856c8-ac82-4d05-9c8e-702d091e930f@samsung.com>
 <CGME20260626111504eucas1p1f9f7ffbd3655c400c6d7bd35e11fccb8@eucas1p1.samsung.com>
 <a2114981-632a-4001-a360-ab78542a1d7a@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a2114981-632a-4001-a360-ab78542a1d7a@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MSBTYWx0ZWRfX/J4uEHwGAO6z
 7VZQXa9gs5hCL10X/YE//sHY6rJ4vTJuOfCgZ8FAHyr4pHVbregA+SYh5Ars2X8E5y6ZuKjeMCH
 zXi5ZvOn0Ibm3O7krImyR3tSQCY9YboMsnibZxb0DpaBRD21R8Vv2Z4KHQJlcr2TZ0OPKQKHMeL
 JEpjtbhkmwSfYnw8tL3fmRGxRN/rguOP9NaQddCI6nXV7gE0WutkvkBv3mCngxO/oBXokw9zmdX
 BV+8gYcvFdWG1hlQTu0Mpvzi+hGClptBWtwn/blRa1UjQoljjr0xJqKDoF7F2otEfuq6E4yB49G
 +W0L791T3mfrp6IdtRGtTIX4z3SQf661KDCPsu83Q990j6C4JV71hNuA3Dpw5JdDt2G7QxSZtIL
 OAM2O0tR+QYBrVFAS2YX51xabGihus7lKCDOjGs4nELfA1ItmOKh8KvZeK9btvvk34eN1HF5vrG
 GiC6nJ1KWH7smXRfPrQ==
X-Proofpoint-ORIG-GUID: IzsgaZaNpyYZO9zzk79w75KYS3s7SekY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MSBTYWx0ZWRfX0miAYlLd+szE
 0DaIGSyPykYVpfWfZYS3I9VQ5AnMAoWOeeicXS+M/CTyMkWQ6BJLpAQFwrX1e+HJhd4v/Oe6DgJ
 lDrEJB9X8ohVi165uD/QoYRweyKMvg0=
X-Proofpoint-GUID: IzsgaZaNpyYZO9zzk79w75KYS3s7SekY
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3e5fa4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VaNlFodcNc6lOBzK2YIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260091

On 6/26/26 1:15 PM, Marek Szyprowski wrote:
> On 26.06.2026 11:46, Marek Szyprowski wrote:
>> On 11.06.2026 21:38, Dmitry Baryshkov wrote:
>>> On Mon, Jun 08, 2026 at 10:09:55AM -0500, Bjorn Andersson wrote:
>>>> On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
>>>>> The sole reason this hw exists is to let the branch clock downstream of
>>>>> it keep running, with the PHY disengaged. This is not possible with the
>>>>> current implementation, as the enabled status is hijacked to mean
>>>>> "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
>>>>>
>>>>> This is an issue, since the mux enable state follows that of the child
>>>>> branch, making the desired "child enabled, MUX @ XO" combination
>>>>> impossible.
>>>>>
>>>>> [...]
>>>> Applied, thanks!
>>>>
>>>> [1/1] clk: qcom: regmap-phy-mux: Rework the implementation
>>>>       commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c
>>> This breaks at PCIe at least on SM8350. The attached WiFi card is
>>> not detected anymore. Rewerting the patch makes it work again.
>> Same on QCS6490-based RubikPi3, after this patch the XHCI USB host controller PCI
>> devive is no longer detected.
> A few more comments. I've checked the PCIe initialization code called on Rubik Pi3
> board ("qcom_pcie_init_2_7_0()") and there is no call to set_rate(), which would 
> change the MUX to PHY. The PCIe init code only calls clk_bulk_prepare_enable(),
> but this became noop after this patch on the mentioned MUX.

Yeah, I sent a revert a couple days ago:

https://lore.kernel.org/linux-arm-msm/20260622-topic-phymux_revert-v1-1-f6ec85523840@oss.qualcomm.com/

The platform I originally tested this on seems to have different
defaults.

Konrad
