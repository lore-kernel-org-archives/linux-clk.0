Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660068;
	b=ukAspsjAwKNSx7Byqtf2wkXv7VFcR1dLAbT7WqFjh4DHSwG8okB3Oel0Y10GSYW4Knrq
	 aTOMmgYRZIzSBfRFSbQVE94PaekaED5EpIvHkvYrLzFN28Nnm7wBMyce5NMU02C3t0Yd9
	 Auy0vI5mydpspP/4bo69ex4pvM8jtrMpGCeVvHE3/BSGPo9NN/g3OkEaKrwHberjCbwy1
	 RCybXqzrHFKFGYiy6UiPPEMjcdk2vdvnU/k+143knGQASbEQON4CTmA9786FxvqIVELUv
	 Twik+cWl8rrqmyKZXvhI6WeLZdanDnf+xtvLNL0lVqWmC3Eh1TWfLAj2Qrw60wBmfJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
	b=VLFeMIWYLQ6mELLItXvh1OEPtc32zsL/fpQKVJkRwYFMEO/kxrnzF8SSH0T0ik5bNkIt
	 Q5UiAFv+kB3ZHwzvyClLn04M1ZyJojeKHtS8ulLl/IHdiSPKWEMu8alZaXuVoGsw3Gh9B
	 /oCOZF8CWu6U95tKLIaKbn/BoBNY3JdWd+g7wtSzng/OxhFouJNA69ZSKY8rDkfzBzCRx
	 3Xm4fIPPUd61ZElxOfbemOgJKtBUElMUqiVdnf/uX99HkuSUEB0GVYLqyUp1u9A5x0t10
	 bN73jMvjei40VmPsVQY+Kx/zhHbWl+pFBF3n1mplWhADDs1D2FRFEOmFhaxUIwNPeKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4vyjIq2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EunLO7FC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37803606A320
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 09:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37803606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4vyjIq2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EunLO7FC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70A4X4110717
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 09:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=; b=R4vyjIq2Cag29CA8
	G4x6yXFU9bVRvJaCxHAHKK21/QDksBa4W3iQwfghy4OArd1fa5BAEKpgNFuMm811
	s4ZDQkT9Q+pzZ5EJSN8yqQQ+aC3d5umK7YrCL5VNf15qEOzj5NmSjjiM+BomNkXm
	KFdAQEJYZie7sRvpKs04i++qDNl2H4HS6U1+yiJINSiBApcfSR2BKKFJ9Rbs7neA
	eylqhMXVkzVtV638K/yOFEVmjZuju2tCXHN8SNpAzbITz0TmuM9KM5P4uXCuBsxl
	Nafotz2yQ980oZBjQYHLbTvGak4/gGUS3eNhz01F1IGcQcndKt7skDzR/su9U7UP
	nQzhTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 09:07:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso48456185a.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660066; x=1793264866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
        b=EunLO7FC6tEUbG/IxFwpfvusOCqC43hYuhEo4vfvPmUPiZChiO4Pjx4bBcID9E8UA2
         HJIW2Y7CYSTuplHvI/s6iNk8ZhKxec1EBoZbxgErpKLG4TUqFKRBJSI4AzkzL/rCr2tW
         +r3R476asrvw0fMpwu2rw+Mm19ODh5S7eRAmEUKuDwnWctperTu1/+QCdTbsnkHi8nGT
         6CGD9j9Wwfix4rduGCwUCJV+twg18Ty3tSx2mvvfpC9BoGWbysWi8X10cacO1J2ov61v
         GuPXiK12eGRrsOjt8rm/gh58AvSTHoU3t8gdgCDemGyHOWNRtfUQ5r0p4esbDvu8ZfSe
         lmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660066; x=1793264866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
        b=oTghDXGL7twAyeQoK5AevoLkMsaLnSc3LAvr5TuJSwoDTCu+jP3iQoZpPr7EXZvXFv
         9PLZPRaKUNKkJ3wBLmNthoh4h9o+WEU4c3lgdl54CaJP5NxPvyG/q6mD1ZiOEJa+oS48
         d4DklKdPIOGd5U1SPcHZHKAfMV3txrTQ5c9Zzim70aPUhbWclCACE5dwKLHSJaNL/+NH
         SC+4C4knGsfzfqxb5k4vh/3nmVEFm8TwotYjYtlttFzMCEVwTjU51ICerwhHxJG/NqQx
         UVKWAYJPLS1b9ECJ+LBP5anocqeN+1eLFNWwYA+sBCGIHFC3uXYBlZLdszQM1Z0LCFsR
         DK+g==
X-Forwarded-Encrypted: i=1; AKwUvBx4BEaKu2mMFWRdrSh/bOPkjNocev15LWIrJQtIkgA4NlGDeaOf4UwTblyc+gNPyit3p5pB8xsJVko=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCz4FxD/tTeUQ8iusT5M6isB8VQe/mp5KvrmR5fNdHwcJ864yv
	EuSnsNvfSEWEjaWheuaRX/1FMbOPJDzyF7mTDr1txHlR2ymzIoQzhyfokIfhlZxR8cwiigQgmtM
	91qb2vPtZ6erxKLYnk60xNB6ZFMPeiRRuRVb7XHboKPOHVHxar5pOwl5QpMVRdcM=
X-Gm-Gg: AYBFou0UxSZK4x9kDzXbwAh9FwDcYw/lTKvDafBlh0xLLU9j4/81yCN6T+Etvh/GC5R
	1/RqmPRiHpkFCls9XFB3BVF8YiMdUpcosioepVpNBoVON64JrYIy4B0vpHzGtb+WEoxZxRoihhA
	WvsbGCc50TTY1j/iKYmktbJgyNnKMIYYOzxycH7YoAGc+uAxmZfEXTPW41j7KUrxmutPf8SPlib
	TbYJd9Plv+La1hDxIj5nWSRRqxXT35+PgyM3Vwt2VWch+fhRhLwKnTiqnpiEtLbhYArMj/xKPBV
	I6U2nn5qdF268alp9ouNf66yezD6dNFKwLSeRtu6oCP/YjcYVAjS270saqsdb6sQZZaGKWfTASW
	74YNuK7gio+vp7OezAstGLA==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr955689285a.2.1792660066457;
        Thu, 22 Oct 2026 02:07:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr955683985a.2.1792660065814;
        Thu, 22 Oct 2026 02:07:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcf7sm85290266b.24.2026.10.22.02.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:07:45 -0700 (PDT)
Message-ID: <8cc2f172-0df4-4494-bc1e-3124cd25afca@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:07:39 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
 <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX4lsZs0Sp6YhK
 sTiweCjlFdH8HFP6AjTCkyceUEfjau2PKdEdOagvH32piq9XpUAKWvkugGHIVorCe+O5tWWoMlH
 TI7W2eJ+GV43p34Dsyrxm+IbJE7n2erol2AC8F7QjkbqRBgHYfHhLj5xLSPS2eneSjHWeCEhQ2L
 xj+du9UhzAhVd1L3+yw5L6sbuCC/XvNsLobJziNUjZrnbnowFePixeH1kY4o4U8p+GRfwmx+h8j
 PMLhd5FMX+sS9sAthL3MAzwJd27o7rOZ/9vO0Unrcte0e4JWm2r+y4d6L/25JpEprrGAb+2PfW5
 uRScREP3V6bthj7ekAVWKUblMOsILjYhpowqBnj32tTLoeSvjZ/vVALC7jfHiFlhPmDfvsorbob
 9q4qWs20hiLPH1xu3n17t+R1WboQJHLaiQ547mreP0b1E8QpxmoKecGqqFoVe9fJXL2fD2JA4Es
 3O2tc6zHDFKIVOYUw+w==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9d263 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=amIBzKCq339hV6VJ64AA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PG_8bmgMLvqawm0tzcrsS_p7uKPm_JWI
X-Proofpoint-GUID: PG_8bmgMLvqawm0tzcrsS_p7uKPm_JWI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX8R2ioNvEgL9E
 OT9A2SfPBSrJnQ9HBa5kovXxqJ7kHmVx0/b1mg9tYW6KDD1tShDfWLA8VBrd2muyFC/QrwIWUj1
 p8yTOEQhRo9EsPA5CUGQ0QdDFAULvwk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/19/26 11:18 AM, Dmitry Baryshkov wrote:
> The SDM845 HDK can be fitted with the display card, carrying a Truly
> NT36850 WQHD dual-DSI panel. Here it is powered by the PMI8998 LAB/IBB
> and WLED, and it is mutually exclusive with the on-board LT9611 HDMI
> bridge.
> 
> The configuration follows the vendor kernel, with the bias rails at the
> 5.5 V default of the LCD mode.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
