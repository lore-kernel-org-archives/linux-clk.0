Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3A938F643
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745598; cv=none; b=NtEJVDKLKfhA6oeUo9pgyxCU9P0W4k0pVQIzUGLl9GXiFsquKFThDn1h42nVMPBi7WieRwYAhKPxZVxpUMvnGfMGP8PRhSj/5Z1fb38fGZiKqiHOAMVkgq2bSO21UeSPD3mOdwaWUGmEH3JFtpRSavsSJEyHKiGnByIFiM9Xq1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745598; c=relaxed/simple;
	bh=G1TLb38XWfS4xZxB7h4mOgN2KQ7uuD/Hep8vHnneZEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT783SkYBJ76voBJZb9scdUksGXCrP4VNsR3rEH6CZrqoXjMU0kLA6jIZV3d3XqZvi9AacMBdedujcLtOKjoCsdZhhwLnAj1YXDvAv33Cz5ncozFcuL5ZlBLcJcJqQWLv2s55TKK2BnXhc8QUQQlN7EXgQvlpwXuEXMOyrPEtZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0ERLxio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCWu5irg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0ERLxio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCWu5irg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGKOB1290762
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nYbMhkKS6xw9b2c9donMphON
	nCoJY7folpJd2kFJroc=; b=Z0ERLxioWIz/zi7VhO2xm61p7BALWaRPRNpMVJ7A
	J9Du6k8ZBIvt8+6ZHgBJu3GYNvrZ+y49g/+3TdlwGds0Uyp3QmPNBYdzRNzwDfEp
	pSVqY4FtUGdlKKVSXz4zv8owFvhfN1Eg2humX4VRjIMbVPJfQKwRhmCHWb3oHZ0i
	XDuTAkq7bfdeAF08LkNdNk2GM/ZnT+nhUJb7m139uTkCGcItL8rdBGCaJDsOqLAS
	/ImCoYz1SJcnYLa53JDE92yBYIJ0TqbLll0f2EDLZQhbKrofCXWfjw4eBNV6XGlZ
	jVRlIbP9zirPDXBA4FPUOhgwrFdMUMIc2gg8lfIn9FS4Hg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmr8y5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:33:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ec77e0184so2393706e0c.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745595; x=1781350395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nYbMhkKS6xw9b2c9donMphONnCoJY7folpJd2kFJroc=;
        b=aCWu5irg9byI3wvYzEWQzOic5VXnf6L/cOSHTxFA/eHPxh/RPkFeD0EFsRpXa6523p
         mie4JrWgdrX9gewLkwiSsrOaDrOPjRk7V/kDQ9QAhL0hWHpeW6oOa9sPiMJe0snLo3JC
         /EwvPNgdrqyIvM3Gdffyn+v+HbQGM2i2wLdMOXJWeBk7iN8XPe902mWZj8xKNojEvw/K
         6AFe6LlWrPj2rYY+RdzefGt/Ipq6nAnLqRctZZwYJiIUVEMht33IOt+L6ZO1jb+m699+
         E3CtDv7k626xQmzGZyfhrj/Ns08DmWGmwCyPE/W4rS+QQlpgpI0og8lyOqOlmKn9xlhJ
         tQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745595; x=1781350395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYbMhkKS6xw9b2c9donMphONnCoJY7folpJd2kFJroc=;
        b=jZa+LlUMg+Rjd1DRXuOeBecQL3HTvSYwOsu3r5BpVtPv2efl4q8XPv/7hHrSVufH4N
         adEsv3dV3S3oGxfyzKxGwYw2y+AYVJvxtYTX20rhyNSkP50fD+YXhT6BwDYkYxfoBYqe
         Mzjm3g3sCDzJb+BDQLjOfPdzmYKI4iLPj65SsPNjgwjHASeDAjcKoSQruYa8DoJyJIJ4
         Px10HFUH6vx1HWyybAPiWF/KfZFsrQiqr/Uv12ttoPSrTKDXS6vdtQGMhnicE2Rf5vSj
         2bpPNOcDeCxlgsIvvejhuPWE5io9dhIBpHsPlTr7EI/GjQPIhgzLnvOkvclHTWPXFyjd
         xUaQ==
X-Forwarded-Encrypted: i=1; AFNElJ862K4TXbIF7QUrgc4mrnHHnIEcUzlEqDBAB+jEg4M4j45OHpZ+o/G+8vPvE+H298VWHwiIKBzU500=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR85kwRv3eYyCCyiQenpMSfSKu1rB4Lh1Sd8B27JyaoNoM0fAS
	gFWAsw+Tu0OgU/StCkAeN/p8kuTAIG1LjGiCqxM4JjjjYaU5XWsTuB2qb/lWctSiiA5hhMpszGW
	8MR9QfnPmnblK60OTFYMeamp8hED83k0LvkXGKClQfuk8XdcdKOoXZNxZhULsZi8=
X-Gm-Gg: Acq92OGiNHINFRffD38MsAlkmfv0gNU0vfs6OGRxAuO0DGEXmIdG5MYn8bQDzrAzjby
	hQ9aC6wEoiqLZwO3l8wY/3vLb4otb1ipSM0zZgpR2jHLHx0f3y+2M19GJO+lpks+2PB0pW/XC9U
	iRN2+PfoF0v5ljoHB5vh9BxyMtdnPX1Q/HYt6NjhN6KeT4DXQJHLBUNA6Ni1DKQlPdiL0y7iuRX
	giwxEm4N8At0EUYUP27p0dBuRCFJt376yhxMH3xnDU3qZ6PvetxkZmqdk3qMcm7BNO9/OMFrT3Q
	kO7OqKAI65HvP8jW2+ZVYKa95QGatJuTBqO0e6PwQAO4gQ5Re8bHzgT6LLVkOkC6sXxCyinDnZC
	DcHhYuxXSkwaBB8lPTTlCt4H8GBoTMDherp7kl0MfDtTE1P/pffRfvITQ7LhEPL0JVT2Msd+Rvx
	uGzAJSYE5Ial1qwZyQSiCToiMofZLua9VHx50zSBet1afn7Q==
X-Received: by 2002:a05:6102:580f:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-6fedea4018cmr3391453137.0.1780745595212;
        Sat, 06 Jun 2026 04:33:15 -0700 (PDT)
X-Received: by 2002:a05:6102:580f:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-6fedea4018cmr3391441137.0.1780745594788;
        Sat, 06 Jun 2026 04:33:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9903e9sm2375975e87.69.2026.06.06.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:33:12 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:33:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
Message-ID: <s6txrbldkuwamd2p62mg7atfyxurtsf6hmh4ryi4cufwbugymy@tqk4hkntpuje>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNSBTYWx0ZWRfXxfR0zay7hM/w
 30FIScfTe9UA3by9yb0xyfZfY6DTUV+l0PDDgQevpl+GjkraTipsLT3iLBjyRhTjx3H6m6PjhKo
 n4IfopBh51dpQoBuTN2oLSlXV3DCwiesznz4SbkBBSUoEEvQMy6vmxKfu/t84SzBJwkwLxnctkY
 jjR/8fEXY81vaUL32mmkB1AIQNkfFuOypHPN9ngBLz8DMKA5WcA8vQGzRtPQLUAw3YineSzIB5t
 9ponQPB/QABZd842pH4iuPR18tVmEOd4xX4HeYnp7kK05BAcp/X+H37YEvRh9CHq0qInJklxStf
 treF5F2wMI+ZC3ai5SAYrUs8d6zNo4DAqrR6tuzeVFTdP5p+86a3ly1lK+p9cpUedwGqGD9ZsDD
 buXPfpYelO0WrNyQSI2I3c649eY6Hpr18bHnwg7fi0llQBHquaC//s72Tipg9qhrAc0nJwt8wO2
 VzmU7GM/2Xs+HQssYOw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a24057c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VucFcp5vOwudSFc8DKcA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: y0LJ_3tL_bC-EiUk3wq0XhUDoeISweMZ
X-Proofpoint-ORIG-GUID: y0LJ_3tL_bC-EiUk3wq0XhUDoeISweMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060115

On Thu, Jun 04, 2026 at 10:56:19AM +0530, Imran Shaik wrote:
> Add support for Display clock controller and GPU clock controller nodes
> on Qualcomm Shikra SoCs.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
