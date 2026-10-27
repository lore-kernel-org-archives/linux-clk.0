Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100282;
	b=p7B+VZ2Z/IsI4s+jlLlINR5xyAvmn7kHNyl06M5lOmVuhwCKZPW2S3ZPQn+Tes+bObgl
	 cg6+kcvrtscUJylc98VZ1BieF+oj9MqCIvA5AY7l7EStAc31alVwaWPTYOM/s+PTmRzg1
	 hL835ZjScn4M2sYcCnN9CD2/xv0U0sH5CK/D1WeXTmrX1w0BneX5POXtomRcGWK4j5Vyy
	 pULt348qrbveg7jmq7FibtE/JcRSG4j9MbU4EmrPnedLTSqPRoPccoz08UiNiC5dPi3qc
	 2rfzXecd6qcReadSefGy/u7lPbWme6c0UrbYUxO15D+0ty+j7OZ2liBfa360ZZJKJ/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
	b=UxC6nZj/3W4cZbQDnfSGH3nVrXYbR4ZLFaK3tEdQJa4LVSZLU+dJNeECpDiOkKC5VSrJ
	 FtTdo97O4aCe8F0B9c+a7hj0msCMkCo18kF+FH+64bueZY8qeug2qg+wbW+6RVs3YOC7s
	 iIQRnoWXcgTU07zYapD3e1ifAojx1JAADB5w3mJ1f1R0SNaxV2vRQvFChQES0jbhy5jmd
	 +7m5oAeeQCuu/4Gsw0CZawkX9dA5YB/JQavU21qHHTkV87Pmfz6CnRU1IUcwwLprEaGUi
	 CsbxUSHvJfb+QVn6ERH0MZ+P383YONLNSQBFfaqFzHqteBcW0Jr1PSC++59SDN7LIPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TRPH/WHK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Hh/hcgDh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04DC606A324
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04DC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRPH/WHK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hh/hcgDh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe1Gh1921843
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EebyHFSMp1n9L12tdULGndsY
	oFeYpVO3FQRxlQ5nOoE=; b=TRPH/WHKXcU5bERME6r6Sfqelaypr4fFjNzjkaxa
	YrKCMAnP9iS/qaiiZnI3szfyLH+fhSPrLUAh124W2cP6GCejTAUF0VLYQE5tziKx
	/tp9d+0n7MOqWtc5qrR04x8pqVAOzXfsFa8QLR5hC9Rle5Sk1Vf5DnAgoDZVmm3D
	N9JWzoR19LOkbDBTtZyjJIpwLMeUwAw+VsUiYZUw9NRbOM5nqNBYYjq8Dd2d1N1/
	G11vD8bnRc3SdQoRo8L+9kenhO+kBtjpn3S0pVeCzGjKeDwCXLt1pJtUtSKWMDg7
	vdc6EgW5Pc5QIdYY9peXirc2Pfd9WGOvX4o/EorN2Bsc4Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68m0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:24:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so718602085a.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 04:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100280; x=1793705080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
        b=Hh/hcgDhL9DivEOD7blRfa5Qz8zze0LKOjo21tSOf0TZCss+yRduFCrTULIjdCe/Wo
         6AT8+iRF75ewkWRJlh01YOvekeRQgsPOT/FHXvnBPlZKfnNDTTBeOz37Y+kQXSeA0iCx
         qGGqAv4ETB5RieYfZ3+QX/4GLiFp/+b9g5bn3OTZXfjehq8bUOCtkP8JDdnBiYxbgYHp
         GWrXqJHa6NzE5S9r3v+JuBq3jA8J1ynNEX3ff7RXdkKK+MgkywnGC37deWZRovPdvbnO
         YP1SgqC5y+qXsTxjdit/IRn26FeZ+wdDtZwWifK0J6qxtI8lgLgYpF1Vd9c67tWddzRx
         SvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100280; x=1793705080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
        b=w9Hn+JM2Iza4P6i3fFK2ff0fSg9BzmlqUMruHO/KOi2oeRFw8C8/rApfEmRSf4kIxz
         5dmwBIFhG+b0G7dGZWFiB6q1GhnfD95PMjtt+8TQ6c6CuCnBNveUxPYr24Dx6OCXUiAu
         t2oxTzAeCnf07OXbFbM+X76h5uZTMo7yXtCPQ5zOTuAiOZ3t2rNTsnSPmpDFdfTJmJii
         GoKE/buOZqnRiBLXtJTdsXGI4zxuAuwZ5h5naXFFw842PQozEqfVDEhlHAMzzYcbqbAw
         n5KArh8mQbT8tGgAvtidXhXO8vIAOX3FADrVmNKhN9gPvO9e3M6EPIypQlTEkrKH3xur
         zwXg==
X-Forwarded-Encrypted: i=1; AKwUvBxShYC9MV2sNQvaZVAG9gl/JUtUsRgFxU+dYOxNqFbNdGdDRH/BRM2iqMMILUdluxNKuHinF+6vXG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs8rTDSUhUwy5XPDuSDnsCtLj/m6nDGKtoK7GQR9zW+5ArlVoQ
	2wE7rSXE8jUXnd0yYgDj0+THDzMWZFpni7HqzzifXZq3MsVkYntSohl/sLSvdJfI1udYbxpIFIm
	8IhKISyCsfNdi7B9NyvzS7e7btFycYjcPkFbw+NjRxix6IXBQQb2++c6FASif/1g=
X-Gm-Gg: AYBFou11yyp4IFW8vy2MeXohLvnP5s/QMZuNPmGbX9aKemiXwIbA3Fc48H+6MGufgEc
	WQRY3oKPT014SMLpiBJodTUba0aKAmZzcI/EYhf7aE96p13p8gWp8vRqWgGdCeF/thxzJ7CygHp
	oDbQbyxh5Bxxdw+wrXGTut9sLfwCnQ3Q7RZbgY4Ga2K7N/NWgHrSyDKuXQCXiohNSiOisrqmXVi
	gXaejP6xVrywdi3lSVg7IeQJ62SdE8ZaiKYFiDuILqrRaxhbc0W1ZOK7Pcuc/5QL6W4JTZnPmW2
	l0al25SAThz9JBPdcDojN2/8GOL0OuesBq39W+txTuD2UP9Wt552B42JL7UrCCf7fTcfireDXLO
	xMa2SRGvw9MIF2SDd
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-940ef914997mr1488917385a.18.1793100279907;
        Tue, 27 Oct 2026 04:24:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-940ef914997mr1488913785a.18.1793100279289;
        Tue, 27 Oct 2026 04:24:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm20649357f8f.22.2026.10.27.04.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:24:38 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:24:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC
 rate
Message-ID: <dz4woik4nsgqpyahkbzvxeq65oaqhopvf3mltpsxvf6dpkvof6@zjsv4sbzjfjr>
References: <20261026120920.1667982-1-robimarko@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae089f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=v7bdSaspc-564zGwiskA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: M7a1xl3befhHp807AAqaNl8m9K6-lRDJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX+EckkHG7tyjW
 xYvcrlHZC0NKINLqkSZ5RkDHbbLj0jHD+dpc3qQr4Z9z/MJAu+kD88y+/uc0+56GhG5q8lK40kD
 JZneH/Eq3WSynOeHD3bWtkYI8EevcNE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX4ywBOh8tPi0u
 7CZefGO9NIgegcOVOFXZ98rWkOfekoVxikD01DiDfn948BZCd+A4uM7n3M1ZGU2pRqd8QKnG3eP
 RiT7Ma6BvKxxAtBsHBCabQxUMczE0R5qPQRWWzytvY1UrwG9Y2Pt8r1ap2P8LRMfhZkgLHNvoWq
 CvPepBRatLDm7HgFViMkzNF29/sZFKshLXtr+d5324BnHiynb00pV9+mCOzSM5enlgwCQsIMQGt
 oi/UtgEmnp0jROPTBCLirHq+8Y0xmvLic87vwJp6gFOKHunyuxruDBrbDlVaq8jMg7Vr6XanmoS
 yxkK4vSjNBVbJKX4AEHFfLVIZFkfQj2fn4sZElQh9rYrSPzPxRJDBSnB/aqmuFEPjd7FxTUskNv
 hwxJptTRZMOoTzs9JqggOUs31C5Rvy+lzInkxZ5EXKXh4vxKPrQU0jrgG+JakGhBnnxRKlVX7Sz
 qfeD1YcUvfHGbWdRinw==
X-Proofpoint-ORIG-GUID: M7a1xl3befhHp807AAqaNl8m9K6-lRDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-26 13:08:12, Robert Marko wrote:
> The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
> a divider.
> 
> GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
> clock for 461.5 MHz, while the CMN PLL driver reports its parent at
> 416.5 MHz.
> 
> Report the 461.5 MHz output rate so consumers see the correct rate.
> 
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
