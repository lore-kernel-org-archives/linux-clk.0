Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E213F9263
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724530; cv=none; b=D+B/G/VLC0Yt77K9p7gMY5pDDU6stJ7a4hVTdOs/qoiEcCXuCI7gxg5zTuCsb/AEgQHUrkR41lA9xTwTnuZcAhzkapM9pGtM94X0fZbI4ZfRBBDc5aaaFY0hi24vT9w08jEpSDmhpMrTAYk9b6xLnapo52aLgQhrvVHV0H4JTUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724530; c=relaxed/simple;
	bh=qCFQKNYCOzLkdrHwzK/PD74pzbWUzqmtD7UHeLqErD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JvQQW/jCWsst1QK0Trb6NH6QcCqzqqAGtlSCr4zpeIOYZ8bNvuR1Nr/loz8kQ9N+aiAJTspfETPAo7h6v9BR/fRLn+1VI7SnK0ihUM/dX3YH1L2ms+8ooHvDgDbWu4FyX+vp/nWHaYgayP/Ied9l9NOQS58Lc60oEUYZ19Iikz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KW1/mpbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdwDDuQy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KW1/mpbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WdwDDuQy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7E0Pn2188890
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 09:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ZkUgMVQuey59o9ZIrC3KxpAQsMzBQOEA3dXXM+SDDU=; b=KW1/mpbsVoUGfOO9
	flQFbOExCFpR5OxrDV1OwrvM3by6HTv/Uyi4PR6z0eqmD7q8IbeSMS0KGM8s/JPO
	AD5TDpzW3vFX9NogGjm3X6mtAWfocdbmDwzYcoTUXgFYmXvzyFENubf79+rUPz+6
	jmbB+FahVJFc1W+945JoaZS/6GrObo0YK9fK5NCknqQnFAlmmoBp5ykP1w+vWe/n
	3owUaE48FlzsyxGfhL3sjtucRXW36ImzcadiiervcrsB92syT8VbNIt/PnsnhSxo
	Zmi3DiuPebj84+dJ1Ld1+xnePRdr1sEUjU1+8YtyARhLsn6y+6R2fMaATGEfuxxS
	2Axs1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trgjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 09:15:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b79cc1f21so72066385a.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 02:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724527; x=1783329327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZkUgMVQuey59o9ZIrC3KxpAQsMzBQOEA3dXXM+SDDU=;
        b=WdwDDuQy2C1s76PncfYmem+b2GrlYUbswpQD8fnKds/JcaUQCBJengA/3LQFdpKdHb
         f+dEdHMZkz49WVO7dT5UTlFnjvhey3BgEqiGEANerlxuCf/KmNna0sMtjdSvFp49Y14z
         sBlevf64x2vybxorHjETvKgYv/C3sd6TfED0iWUfmrMAoaazTaMi4dwvMfOsG6Juar5Z
         AFZCXZWi10VEsA9EGEoOXU9rVniffOXC0b5NZnvMo+3uqYu8gh7giG13hGhnfU/lSg3s
         v9cjeHr+VfOdxvesoxGLZ/HZHhhmA03z60bQyh5DLpUv4qevOkg0PXHtJPsovLdd/TKA
         clrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724527; x=1783329327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZkUgMVQuey59o9ZIrC3KxpAQsMzBQOEA3dXXM+SDDU=;
        b=mpcZmhp6+0QzT8trd4V1xIDYcvwxL4dPfCHvKXyZTZU98oxGvUY6mLtr1KMrWoOODS
         kQt5hTd5U/KjwCCruQpnvBtSDDGYZqP3AvspsP843vhjVCKYU6qnsYc3JFb/h3bQ9ET9
         hC7MkKoi/M8vTlSDOWlAl/UIUiOHq7x8Rv3h5Pg4D/wYYPOvZgsqLXnrZkQlqc0olaMY
         0NwiWlHKEm3V/lCXK0/YvSbt7vDfb+pSzSfRKGVmTAfDdisr5AsMmcdz7UVdkbEpxJC8
         /79Keun3VUynhAwDNGgCuNrkFakpN8NmpRZu/T6MFxMZDR0YnHHuC4fgB1nJ1PhLSeU3
         t5BA==
X-Forwarded-Encrypted: i=1; AFNElJ+hEaoEcKVxWW8ziW4JeBbgbRvW6Pzf2AZwnl44jI1DjIiZTp+Eedi4MYFajH6P9mixA7I0A19mpv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+9TwHJkLIZmdAihIpV42R5LIrId6iG6jpC2wLUGKz67nAIuy0
	dGmBRp3GYWFR+E1+jn4ZLLKhQDYFo6QeEw01uY3vvIIdKMnafQHYpt/C8ehtK31mfsyEY5ypX2g
	4LzD1HiDZkyWJuxqzsDcU7skoYcx9rDKhpX4HFbHsO4hOL94ggl5DyVWQgRSwpUc=
X-Gm-Gg: AfdE7cm4YAZKW585dISNDpy2/YWkyGfl7/C27q+ZJKkcJ/FmIFAxpUY/4MELu4c+NpM
	EotQ04yo3LPmbSOvrXYqRnCZBB6B+mb1hFv4Mjy/6KfrcuuZbxb7ZczfY95UNbw26pR/lkAuq+g
	pb+7q782mqsADRh55iFbPrvq/mGDuuztkF4mJH41odKnnRwC0R2BbEQCe2jm3OFww7PIcAL4cJt
	7l3XJ0IVGDoOryF0vH4NoWUoqAmfFcV7GBxYCCnhI/3SV8FhzsoxdIE/eN1s6lGfMYH70vBJ372
	5u3BoUuzYaKclMWn2bNpLSnMpgyUj0oJGVDEvLw/hffifawEnnBd1cvpCTm83OMLQfXZw2DBSNV
	jv+V8o1AIwzWwCfufO9f/lr4PHIdyFW/O2gY=
X-Received: by 2002:a05:620a:8907:b0:92c:b769:ad1f with SMTP id af79cd13be357-92cb769b027mr681020085a.6.1782724527207;
        Mon, 29 Jun 2026 02:15:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8907:b0:92c:b769:ad1f with SMTP id af79cd13be357-92cb769b027mr681016485a.6.1782724526745;
        Mon, 29 Jun 2026 02:15:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1276093d8fsm52611566b.13.2026.06.29.02.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:15:25 -0700 (PDT)
Message-ID: <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX2zT6bBjE+88T
 C6QkiUIJ4VqeZBZsx3/aHSjODUiHgOLj5h2Df80ad2vwwMb1urfC8UZIyWejdeN3zJ9P1VyNa55
 a3RNzO5/0T1XO068hgBQQ/N+hU+Vs0KQAfWaBzT1AsY760xb0wGt2dG99yzuY2oUwzHS0KtD56K
 NPgpNhQrQB76u+fGdrfzFyySGfPKwKZu8bRwjsDHjQDg5zdA2B8lWCSWKY0x+hFbWXXuYC7K7vr
 Uw/sB2ZBO8WdCHnCyQer0htkSMp/PwlDarAIKcDbdDi12Si+zyp7taOE7aGHyOfDlsvqpnCsx9o
 TGgfedJTrU0myPisVJ8IGUh4hXM7HovAhqvw9dJamkVkxGzLduL3ZGMu48ZHksnBisv3xGcoTci
 tGYtJTsAgmC66JTjkb5qcW7m3AoNMLIrNKPAn2onJVfIGyqZEoXpsSxKt+2FmDtgPfV2WF/gAN1
 fh8hn/IOAvf58pouU2w==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a4237b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OLjij_zqaC7basKHGfEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX1LN02xgukSxn
 VtJBHGUn/JbP4xaXVdaUIftbw3YLf4HH3+zKjelqWSuZrdx0kWh6a6PrIjG7LrUTaqt07sgMAxi
 qgVibSzgaM0Rp4FD0tz6HGNbjSK9Wmc=
X-Proofpoint-ORIG-GUID: y70vD3P7nC3y74vtlYw35c-mUazQDXh2
X-Proofpoint-GUID: y70vD3P7nC3y74vtlYw35c-mUazQDXh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

On 6/28/26 8:07 PM, Antony Kurniawan Soemardi wrote:
> On 6/24/2026 2:39 PM, Konrad Dybcio wrote:
>> On 6/24/26 3:57 AM, Antony Kurniawan Soemardi wrote:
>>> On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
>>>> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>>>>> The HFPLL enable helper waits for the lock bit but ignores the
>>>>> regmap_read_poll_timeout() result. The polling condition is also
>>>>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>>>>> as the locked state.
>>>>>
>>>>> Wait for the lock bit to become set, return timeout errors from the
>>>>> helper, and propagate those errors through clk_hfpll_enable() and
>>>>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>>>>
>>>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>>>> ---
>>>>
>>>> This looks good on the surface..
>>>>
>>>> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
>>>>
>>>> Konrad
>>>
>>> Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
>>> Krait era, is that correct?
>>
>> Seems that way - cpu, L2, and GPU, maybe others
> 
> nope, tested on Sony Xperia SP (MSM8960T), the phone hangs

[...]

> [    2.679716] L2 @ Undefined rate. Forcing new rate

This seems odd. What's the reported rate there?

Konrad
