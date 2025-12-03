Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41DE2E8B8C
	for <linux-clk@vger.kernel.org>; Wed,  3 Dec 2025 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759144; cv=none; b=tk0/wpAgHB87VlQZVSsixKPgXKZ1jNTVJaE/Scb6lgv9jX1qgER/WVBLwgGVi46qjWAcLlHW4ZxJEOleeeDrXvtIBkAlTybavd5yeQAYBNsyWw2fpp/7gb+bg8lXuL+55Kz4JVkzc/B9Txyr7x8L+60akT6lnktjG+QGYDOkALk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759144; c=relaxed/simple;
	bh=ztTdAKd1Kpr5YomVO8DRG2y5O30QjhJMIPeeeKWJX+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cL5gy/XyFKdRfAoSis3bqKTm2yo2Wr31bwy54fctTHu3HppUwPnuxA+mCmgNoEVDwK41bzJ9qzqUe5zMF7iTnJuOlqZb1yAkrHjz2t+eUl1C/a4sgPa9frELTTY2G5zM3k3UvjgZHzSqlC3h92RX0Pt+zobA405n7AnvVyLZdgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peNi5Vc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyQhdCIz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peNi5Vc5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyQhdCIz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39rkWK1929087
	for <linux-clk@vger.kernel.org>; Wed, 3 Dec 2025 10:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vZ1VnRCXWcgnHJPtqVaYUCxuUng/cpM+q7cKSjAg/c=; b=peNi5Vc5bggo6gKA
	DfST/T/TqhUlTAs+tCcAEOr7UIjv+nKXP8d3roSYVB6yfJzpJqSnZuvTA1VV5QFS
	oqfUU0SEduGvZPP1ysSLTp249x02Y7gRwYF3zKwso3uBT/SAoTFrJgaFtEgHakEK
	Sa0d6LCW//Ua3Yqlt8nPSJudi4NoCY+MqLjB88JDi7hgy6KwVg5wDcXqGOQZi4Qm
	EXYXykqBYLY8RPI1sDffV6pioCaZCwh5ZPWSQT/50LxfVYoeaRgTwd6rUxGH/cbK
	xboiRYqJZXiE0pZwm/nuXPiMgs3u4bfUEje03EK9b3dulvp5657JQByPkF0LUaFg
	ICEUAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjyqg5qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 10:52:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so199242885a.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 02:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764759141; x=1765363941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vZ1VnRCXWcgnHJPtqVaYUCxuUng/cpM+q7cKSjAg/c=;
        b=DyQhdCIzt/jL6g/UtzxdDLHRgTAIdZhT/FvvnhPdYRZUWMtYG9l5Z+WLtP77q9C9Ir
         p8z8uDeUTAWwTYhD2lf7lBWJbIraK/5x0Dj2lmy2fBWNthqPKCqHf3GmzIVoSiR9D3aZ
         RelAcFPXpB/UL5AAP9DrPhzsPpsVBOl96Oad9ALpbpKcn/jIzoqSKsdYl7KSI3dvwPkq
         DXJFM2uY0LqPpKDwvVCEamP41Sk0LjfO9NzVsotumDZJ2o96kSp9H49jg2Ts1RR8gFYj
         qgiX1R8sovgkH2KglE0AjZK90TnlvelhdzpfH4Crq1F4WZd3mFNk7ngcf0mUA7LJajj7
         rR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759141; x=1765363941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vZ1VnRCXWcgnHJPtqVaYUCxuUng/cpM+q7cKSjAg/c=;
        b=MFfZv6OIQZ7AlqMllC2y3EVl1FRlWi1D5GcdZ2E4natmE55rstx0+M8rNY4W7y7UX3
         ylzAS8o/J/jfhwwHR1d7xmtdiA7lqnBaG7NjWDuNlNjYvcmorLsiVZTKKtZHnVaI82+C
         LqbjEilve+pt+T9E8Olp4/vsdzLiaIeBZmXJyDy3ygObvawbJClYoOvZunKcfUm/M82Z
         bfgN6LJ6vwEMo5cTWEu1jbPcxZ/5BlDlxXVbc6qSgJHuiV3UVMqu3kqevdZU8rr3Ebz5
         o5+SoJcEsQDzSTxVSm9dTwz/Yr9E+KwfLGar2q7KMKpLlm6wHiwWqF+xcTNtPsDA3DqV
         G3yw==
X-Forwarded-Encrypted: i=1; AJvYcCV0qlkxo1wfJU3A5M5O/xBmbnuHtHAvQeA98Q1atg3h4WgRVGnBidJVVbOrVrO1q8u6cWF7saApdGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxzZEXrO+LOOgZlKTvsG4lRWlovtbvmg8RNmicPA88BWQkqyhb
	1/no2FGT0guFmEILkT/zUEphQ95UsicNeb8dnL8F/iedvhOEttT238sCIIPgb6wvNNZHv10NEJj
	4LJVYh4nfkDAqGWa1MVwFWoNyaaaPH2jHAfoQiwsxRhA3+ZHx9+owEROrFSShE5w=
X-Gm-Gg: ASbGnctBzGjD3icbOBmy4sL7ocaKVIzaPGHons/ertoqfe2Kf84HnrgRsmDW93ZOrY4
	L2QYOPpeauvTxxNL15HI7reXIUfls7Ta9dYks6ZHxzyDKvsL50xKDqHU3EKupDt3wgipE9wYlmb
	u145YjuNfZDLfSVAZ4gtFpgD961UxHDJl3UkRXzvGHIwU8FpQfTWj/Mhw39WZjkdPlIKUfMEyCH
	1qRToSTfyPxrYTj9+gnEGaZzLfDePgXndnkeLFOBvTciTowXCyyOipoNm9DI5WkgPyPs1OTDcOK
	LwXDRx1QgEfqPL512rWWCMlaNMMiLRhRa0bRfkFbOGaBdASpSR43hBUU46ltu44eFU6gE8vEcPN
	UGZyCX6oNCTLN3YMjrgMZcru8C3WcWd41uYGGiSSipPPcOmQfacpfyobermb9E5UdDA==
X-Received: by 2002:ac8:5aca:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4f01b3c6537mr7755951cf.10.1764759140847;
        Wed, 03 Dec 2025 02:52:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdWUGIoNIL31WiMD6DpVjL8veFOOnMngyL++n2fVxw+jql4LOvHqu1/kBYwXN7VlvemkiO8g==
X-Received: by 2002:ac8:5aca:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4f01b3c6537mr7755661cf.10.1764759140401;
        Wed, 03 Dec 2025 02:52:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59e8612sm1706205766b.52.2025.12.03.02.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 02:52:19 -0800 (PST)
Message-ID: <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 11:52:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the
 cpu_clk_notifier_cb"
To: Christopher Obbard <christopher.obbard@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69301665 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=WelLum9FaPyErNbxTGEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: G5oq5kmh8e0O0cSFt5bBrpEnuGLTTXmn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4NiBTYWx0ZWRfX88d0MEb+hADq
 j9hT0YtNeNGV8jgqGoQ+Lwq1o2TlNJeRE7n0Yjf5tIKX3JgcLFtwWuZOf7JBrB5gr6OKSmp5tUY
 Hy18GsQUMx2ywum7wUvoLqTTm3MGZDOqdWHNR6VgMK8yLc4uxHn4Me0O+LuYuVoOauPpGLkwTOX
 JqtDj6iqmzeo2XvMBALBkFTHdXE/D+WjU7LfqBKuuEi+lNCeJIZBrm8/GXl8TpnJKl41JsWD9LT
 vY5wgjRAUZIuUV76+RaT10EIjN0rAd3+tyWR770tLUPbi80vvNFLiWOFhYVFFpi7SHW2hLQr3NW
 kZXzUKaHpG09rg78eSo194DBBQ3DFgDipckcPPU0xRoM1igMNsG7Qfw1Ob1VaVZBeS9g4cVrbDL
 JCrzWOsRyVCqcF6HrMfUv5B6GrlXBw==
X-Proofpoint-ORIG-GUID: G5oq5kmh8e0O0cSFt5bBrpEnuGLTTXmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030086

On 12/2/25 10:24 PM, Christopher Obbard wrote:
> This reverts commit b3b274bc9d3d7307308aeaf75f70731765ac999a.
> 
> On the DragonBoard 820c (which uses APQ8096/MSM8996) this change causes
> the CPUs to downclock to roughly half speed under sustained load. The
> regression is visible both during boot and when running CPU stress
> workloads such as stress-ng: the CPUs initially ramp up to the expected
> frequency, then drop to a lower OPP even though the system is clearly
> CPU-bound.
> 
> Bisecting points to this commit and reverting it restores the expected
> behaviour on the DragonBoard 820c - the CPUs track the cpufreq policy
> and run at full performance under load.
> 
> The exact interaction with the ACD is not yet fully understood and we
> would like to keep ACD in use to avoid possible SoC reliability issues.
> Until we have a better fix that preserves ACD while avoiding this
> performance regression, revert the bisected patch to restore the
> previous behaviour.
> 
> Fixes: b3b274bc9d3d ("clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb")
> Cc: stable@vger.kernel.org # v6.3+
> Link: https://lore.kernel.org/linux-arm-msm/20230113120544.59320-8-dmitry.baryshkov@linaro.org/
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---

It may be that your board really has a MSM/APQ8x96*SG* which is another
name for the PRO SKU, which happens to have a 2 times wider divider, try

`cat /sys/bus/soc/devices/soc0/soc_id`

see:

https://lore.kernel.org/linux-arm-msm/20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com/

https://lore.kernel.org/linux-arm-msm/kXrAkKv7RZct22X0wivLWqOAiLKpFuDCAY1KY_KSx649kn7BNmJ2IFFMrsYPAyDlcxIjbQCQ1PHb5KaNFawm9IGIXUbch-DI9OI_l73BAaM=@protonmail.com/

Konrad
