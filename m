Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CC1374728
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 12:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315623; cv=none; b=Zlw8dr1ob1mvGQ7Y+ZNEEuYDkeMtXdLl6Ib2nbB0z/HIsH7aS0cQDhwOR9clvCXwmQEyumTiBlLPUR/QSv8WoKcGAFevQ1Hswh6u4fCspRTLD717K9j6dH6SKMXlX9jR/SwdS4oD4v0MVjS55lK0fN/ZZt2qIj8e7iZLLYLnjds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315623; c=relaxed/simple;
	bh=NMLNltHu1Nt29wgOrkX8hVRJXK1Lap2QsPGqXR5IXZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeJgghegi7W/+QYIB38S4MnPQDWdCZ1r59uOcUNlBnqIO2hHuJZeGcM3JoskMbS71yLdwDrzA9Hy8/z4VCH9Rq9p60ezVkwKNXCZzWtmJIX+aAoJlWhvEhSAZ3Igh8jispj5WWU++DI8cmknscYGxuJn4Wtx3gZ35lZQwm/voSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqcpvqIj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ah3K00xD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqcpvqIj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ah3K00xD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6516qBLM2767785
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 12:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TYA3MtidwBDNp7NQFL7V2gHx
	CYrTzgECZO2TjVz32i8=; b=AqcpvqIjezdUXFntLA1DhaHtgdXrdShVnlSAyeZG
	UTBr3EEvyJJvfYtHHO7OZHQBUmM5TotTItb78EP9oDU0weNZHF3frbkrznD125LF
	nMDJnC7Cpzdt9Cqjk0t49DiG+1lC7VpK1ls7K8uGB8pQpuX5hx7m9NsTBvoEE7HO
	9Vm32HItpBhIDnJb+JywvP/UngAh0lf90SMSon2xMnrVe0aZ0Mqsf+aOaSb/ZqNq
	J0EMAU4s1RDnyl2VPphEDq5/aIGfXgVz6FaYlHbf8WxkOVI3nKKT+CC59y50fH1L
	/B9DDCUUrQnq5/MGiyDNzZmVUtVVbCnIlQ8+8BiDHPTe1w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7ffj8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 12:06:59 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59f054a3e19so2037003e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 05:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780315619; x=1780920419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TYA3MtidwBDNp7NQFL7V2gHxCYrTzgECZO2TjVz32i8=;
        b=Ah3K00xDn5vfCQ4cVBnCj+xyXIKAYB5eSzexsbTCBIE/p7sH/2lDPCtCCViCJxir15
         NnQ+GYfpFOLapqhQ7QhFXU9Uo3dsfc5oZONJv+OQKzoLHpSWYjA1dNGYHrbkLd2Z7bxo
         RFAfSztSymUhhz4latke95w2AiKlddTnqog1n1JiYNy6yHvHEp+K3nbSPRG5FzqIBJfr
         G5MLlrDiQez3bje1PHCWQ0n6ZjxIsZ+hAlvvW0kIwhnVUnnW9g7uZzHmeqhqDOf6nJX9
         9RohCob+km8PO1vF/Td1waZTPpW4hJDFJYXXxAsXOZ7NOfWRCWJOJp3BNS0CnL6FpUa3
         7Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315619; x=1780920419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYA3MtidwBDNp7NQFL7V2gHxCYrTzgECZO2TjVz32i8=;
        b=d7TqfWQvjYwDbFfqEQM6L3Eyi+VX0k0cd1w9OVseZKQS2VJF0B7dlA8pnqv1h4l3I2
         BzAKPFJbCvPo+S+mxEPIbPYor0nnaDHl2ykW42GIaSrIlVjBVBkq2n1TxzQNMjn6cFD7
         0gHD2gxWhwTrplPFmMtES0eSww/nu8tmGQ7pDU7EW9lUwXo+G9Q0pDRZ5esO9irjQEjd
         dfnxmB16WM6cv/bLt6txse90QqXE9ow/h94TA3+aJkwlvCSxldoF3dW0c1d9k7pLURzG
         PoBeR1Geuu+OYc/xrFk8uublCIPCJnfTa/SdP05a05s0Y0Hhg71lFLTn9nd3gWFfZ1G7
         ghOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7ehGS3ppb92MjP0uUbLeOjCIZugkRWKU8EjP1wUbctL3+aEXAjizcibbSYq9JXyhbxJgv3D4tKRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzexLw67hwswIcN7oV4oFSDtghNbtne7OL0A9gya4gr26xPvjy
	BY/Og1Gsj5C+GSGdHHvhCqmnk/y+BRRiCIAt2B9BgXJf2c5P8uJivsRUPAVvcv8FEpUaJ38jBSr
	xlrh9LEz7Ow4wj6qA2vXrj5IbLf6h9gVyDHzz6des8KTDRKlWA/UmwffhhOXy3/g=
X-Gm-Gg: Acq92OFf7liOvuHBPPTSIK27WKHkCU9N+yeeTIsU4s7FXJHRh1a1QQRzFQSmkqCjPuQ
	FpBsU7T2t9nq6Z6xyerDhwfnqTHRCASrxkvNgqnWcWTHSf8SFWzt1FdAvG+on/tQ6YkoxLtZ52Z
	2zHhHkdihM1QPmUG0AoiOK3xwJbuDwNVypq9s0X7it219NnHxl/qxyfTmfIknn1RRkwJz7Bed21
	ksaomWxWB8kdAz4CCBWluPo6PMNi1mdDrY/zipKi0P5rvfdv0J7Xm4+BDrB7pYjZSyC5kETXROc
	4Q7EGPOY5yMTBOih65oCZP8iZA2sMMIOdaGKag8SHsKvXih4xukArboNGhS84oAivHs4ZpW8XG3
	qQTAi/t2F168QFLpyYN7D7ICgFFbiq2LHpuYg+3aj6ztrmiShV6SHND2DKk+x0n5Tk5Sm4aebtQ
	sRWIIX9LJfshxIcWs4lJO+r4q2Xdm6hRzaBqlwG+Vfaszaiw==
X-Received: by 2002:a05:6122:6093:b0:575:33d4:d101 with SMTP id 71dfb90a1353d-59beed57eb9mr4851433e0c.2.1780315618679;
        Mon, 01 Jun 2026 05:06:58 -0700 (PDT)
X-Received: by 2002:a05:6122:6093:b0:575:33d4:d101 with SMTP id 71dfb90a1353d-59beed57eb9mr4851384e0c.2.1780315618305;
        Mon, 01 Jun 2026 05:06:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793c42sm2046644e87.74.2026.06.01.05.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:06:57 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:06:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
Message-ID: <a37efde6ivt5olxuiogdpniixhok4w2n4qdyj2csbnhzh635kr@j6l6ycprrepy>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
X-Proofpoint-ORIG-GUID: IhPiooWoOoNnK_o0nFMatBxs7-yvo3Zy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyMSBTYWx0ZWRfXwEM1AkO13d5T
 AWAPl9yuAq5SgKSuW0UjxfnLoA2vxSldMz76yMkr0beScsTLQA/eqtYiLQs8/og33jQcfzDfNFx
 ZkZ2VWxDXkR6JGtT4aQbKkgj59KeyIwTgOlV6NROQ/sqj6pGiXwqe83wcztjG8orpVnbfxKWejW
 aNppZFLsqUyMxyoSLqIIBR3AUhpa4Ve98DFPbWtjqELUJBSyORYyo4E0mB+9CNLr6hNOCDd2Nva
 yEOAewyh/y6ANb3AIP0zbmkIWcONNkByu3+3w6Ec3x173QY8Wffoj1ufwc0UEWXhnMudzbeLKc6
 c2/1DY7VhAPGV0MkZb4OHcb0KaTA5/qwU/680uY0M2ZXrxXyFogDP4pErIVqcBHiUzsPPn4YuMK
 x0Bdd8tXVkQg9SAuZxg4EGQAEPag4X7tOe0YjC5voAp6orAw/bpGguTftB38xdiPurKEXt5Ljgj
 8VgTSXOjtOWlpNAahfw==
X-Proofpoint-GUID: IhPiooWoOoNnK_o0nFMatBxs7-yvo3Zy
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d75e3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=RM3L-PboR186kqoymW8A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010121

On Mon, Jun 01, 2026 at 03:51:18PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
> 
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
> 
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
> 
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 

Please make sure that the DT matches the USB controller schema.
Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
