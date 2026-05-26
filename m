Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039CE43E4B4
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 17:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815704; cv=none; b=JAYA6OazQLEyj21OKhwqgH1M0dxWSYxkgiFwwkplGKzAdwwbc3ozUbLGM2rq2nd1bmXLWFMgX6aviaSe0xxOGz78aIt7XHa5UlWsnYdJwoW+Fjy3nWZgG+JP9GZp20irNvWI5CO+5quyzjP1jSqdjL6vFbZxlVMYmpdNnJySDuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815704; c=relaxed/simple;
	bh=gozXShftRMQ9Zq4Y13ikrh9MoSOesCT7RHpSZjBg5l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbcYWWTnE82odO/955s82duOXvsdxpHaHaezYRwvmppGIvIH1ePK6J60sWsjx+XVSCuq4prPVkrWKKHNyqUd35acOmiwXnNYURDv3secQZMStis2XjKHo7vE3+v8a21L5OaGRS4qe+h6N7ESK3baSirActYUF+OE0nU4wnKZaqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1fdhPyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHOPN2ml; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1fdhPyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHOPN2ml"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH15JE3289985
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 17:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VobqPO8lOIFh3fFVf2dOVAMsaLcnQXQFa1MzwwKIlqY=; b=g1fdhPyMfu8VtuZC
	9315iQQdpWLlZDiV3fOtuARdnSh674OvZP1DYChpzyrFjzca7lLtb2Rl+xt8IERe
	ICo4hHrNjK4Zl2KomNbK6L9beGeWQRBIlSSVQF6xUHxP41PcaYa6vwWGE5e4kYJS
	+V8+fbFvuXvHN5lRhw9XKPwbS1v5Kb0rFWoHmvQ5uHrbAFal+A+dLUJjcw2rsoRs
	0XaVHxI4vO+0CPT69TUifrLlNHW0zZy77jcoPFxr9aTiMXZQx3ScAMe9/eT9DUyx
	nanoFj9OviCqzZA6WGgjwdpn+doJpoHzk8FstgipQK/HEXRihkoLImYHx3qQ+400
	h85IPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edf1j86wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 17:15:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so113378945ad.2
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 10:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815700; x=1780420500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VobqPO8lOIFh3fFVf2dOVAMsaLcnQXQFa1MzwwKIlqY=;
        b=kHOPN2mlRHkuz+IUe4UwwZffakxHvSw0kly+rToz/EkXhM9VC8gxy5vdD+16n7+90l
         owiGTnEYDmnG+2t6KlcbeSUvkbTy3ZkDdwqNBdABj93QIctKj2VrvyZcO1rEp0fJ5qh+
         pGdHW3fh2sMjeNdP6z3sXp8bS6vdhz/ibiy096n2BDmJmuYGNurUuvcVgCmJTHPQbKsE
         W0nDmGcxSLatkKMVRYiHphuttKs+oFEy5ydpFDPN5WbAYaArc0gctGMRmmyJbCym826n
         3ZObKNilTe9zQhpPxi5Yja7DGMPiTdWotU5i2LjxDYZOc+Mx6+L6aVa3Qxh5RJ4aF+IM
         Q/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815700; x=1780420500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VobqPO8lOIFh3fFVf2dOVAMsaLcnQXQFa1MzwwKIlqY=;
        b=jrkJCqN8bNjnKAOHOo1QCTDDO2IbhjZOGO3doHLpPxEFvQ3lulTIIhTL9xdFPxtCE/
         PCyuejoxVnFItloTS1HwpUdmu8bPihQ6Bd7QfmmqOY+0ifEVIlOhSB/geB3bDWWBfMnX
         euE3TU7JRQ9CNf1KvDar84osBNpMQWT6I4C3zEyCEcmhx0Cs44oWjavoP8eLcHc1UcXt
         RyfOrQOEkzuBqKSa/tdIJhCliKv9MB18Md2wC2VcuFtJMrToIVQifTdUpfELfzJFQaTn
         MLMa4I7o/UKF8vvqwOtAK/BV391Cz1DkHCtTncUdS57dDnWK20bDOOUT+2tACSXCW5Nf
         Mlmw==
X-Forwarded-Encrypted: i=1; AFNElJ/Q2m8xdeC8P+r/o4vnip5uTDLFE1z3gR2AaDjly6HJMrBR2rzrU8hHsots7sAinU7tbnA8guzmMXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjBPRvdx8LN6NvURyMuTwhsKvVmBx8yc4x5hLPDjQCQTLfAClj
	j6jjuCWvbEFtXo5XPd3CMVPjoOhD4xXOBrlc4WgpiQqMx6cdTxGshZAVkrlGlhguSkP4VgdNvuD
	W1ETluOn1WP44CmNVmoDHyoo1CHdTKcGzAuDuU5KnSypXFR+k1DuYonv10L4OWXA=
X-Gm-Gg: Acq92OHzwBh0RiSiVLSIMCQuzeDJ+YyYpe22n/xhyh+/Ee19e5URPK+JVrBYhndjOmQ
	6rH5tyvkupYzWhC/hpG+PsYqVbrtb9PSUJpnWtuUoW00gf5vLPXAjoWmcopKzNk3cRDqezflFu8
	OnJPHkDw3gOSe+jliDaBzKoexpGYYwiO/FiOnxF3urMPRnkBkNLFYQtn3g2PxWhh9ESj2qCbaY7
	31F3MhlCrf8kwz5lhtrm6Pto8h8AM3qVWJemYzSIi4Unh1YOcO2ohiS9jiUGN71UaoBgOeiEbgX
	05tEbLpDFwlpX8yOijtLRzOtd12s7zo8dR8vtsPCE1MsZIwEWK759VdPE0ITa3mQjmOtheTwQX+
	4q4xpe+Cll7wLfoBNl2NWmRRDKWvZG3s/Kebav+miiDlkKYstc/1y/UvgXIRG
X-Received: by 2002:a17:903:2f0f:b0:2ba:237b:7e1c with SMTP id d9443c01a7336-2beb07ed82amr219267505ad.40.1779815700323;
        Tue, 26 May 2026 10:15:00 -0700 (PDT)
X-Received: by 2002:a17:903:2f0f:b0:2ba:237b:7e1c with SMTP id d9443c01a7336-2beb07ed82amr219267125ad.40.1779815699872;
        Tue, 26 May 2026 10:14:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c7046sm133857785ad.57.2026.05.26.10.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 10:14:59 -0700 (PDT)
Message-ID: <27b05350-fa42-4e0a-91f4-a7950c38d7a1@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:44:53 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP
 PHY reset
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZNjnX37b c=1 sm=1 tr=0 ts=6a15d515 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=aVq2fB6C3sEP8nRkfhsQhw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5L6ES0iTLAyjbOlHcnEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX1UWMeeQBjT1q
 65FBQbaDa6IkzSUA/4KV+qbGfoYbke+gJO1Wvdu/LsnNCDA5v2NPSkLbhyatVJslHiUpbrCr7wY
 qrqXsrpr3LhUh7nFQ9JZ6I3PsALhZ+AtFKwen38ZbJ1mydB97uMBZqR2siTeMC9qqw99vDjbpC3
 3Ow+DyokXylwSvEzHXWbBTN4uhRx4y7u5+P8WlMC0gTU2D3aLNUMWcAghbyy8Zs96XN4fXPLRJ0
 cHLjkdqAjBwvps18MZoGLAhz/kETwW8nkkNx88Z2TVVBlhz2FFe8IFL4jOv437PdIsYPen8wUBu
 HZ3sQVJHpPklE0qGgYMGEfJRuDNHIPJG4ovQ+8z0j/bglAQ35rn5BFc/zlNnG3/qfGRNLcwqRRa
 5JUyrvrpWAiTHys7kGWPcvZuTaXiR7HUSNng0z4qclLzbrAYmIa+eXsoMtzpt1Fm2Cesh0qlBn/
 r3vEGBL1p7eUutk+lvw==
X-Proofpoint-ORIG-GUID: eXkC-bsKFtkDTZ-XWSVJphLVyMdA1FAA
X-Proofpoint-GUID: eXkC-bsKFtkDTZ-XWSVJphLVyMdA1FAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149



On 5/26/2026 6:24 PM, Imran Shaik wrote:
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-shikra.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
> index fc1c90e7e7469818a4372e1bc192761096441221..f323ac5c6400c430b1c92cfc4f7a1550abf08de9 100644
> --- a/drivers/clk/qcom/gcc-shikra.c
> +++ b/drivers/clk/qcom/gcc-shikra.c
> @@ -4331,6 +4331,7 @@ static const struct qcom_reset_map gcc_shikra_resets[] = {
>  	[GCC_VCODEC0_BCR] = { 0x6d034 },
>  	[GCC_VENUS_BCR] = { 0x6d018 },
>  	[GCC_VIDEO_INTERFACE_BCR] = { 0x6e000 },
> +	[GCC_USB3_DP_PHY_PRIM_BCR] = { 0x1b020 },
>  };
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

