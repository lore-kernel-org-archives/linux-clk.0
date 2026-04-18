Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2872A2472A6
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776534369; cv=none; b=GQtxYV15VsSxFlTThLf1HLGOGmYagt9dZvwtybzALyMC3Pj6piyWN4V/0eKNKim0khvSdFTYo4tkBbKwW4B4eywqt0VVLM/6lsM8ZlqxJvI4J3rY47N9bQzprqM+X0MSTjJE6JfjQyv8rsudZUtryYPRAjxzJ9db0RB92gMy1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776534369; c=relaxed/simple;
	bh=p75owHz31Spj2lquCMgQsUw/v+xHw/FCn5vEZQNSKf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8aI6r4iv1z56HggKYNDi/IZPeYx+mm1+Ic2pL/Jgzvdy0T08sC9LSin1sDrtjlbvV0KsPAYqlyCsFUgIFBKT85SAvCG1nYzB2BfO63sdH6d8aG7SIoUnCdQlI8RXSz/i8iKDaX9ad6YkLyL/9xN1WEVjqcn+qNaC5+pI1j24yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXTel2B+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKI32qcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXTel2B+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKI32qcn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4dc33325946
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 17:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ElieMQRQ+IaCgird5S6d7Z0
	R9V7rrPa/yv+ivDtIYE=; b=lXTel2B+JftYcKujqnFYSqitGcD3AUy0yUemkvg7
	0WAVML8jpeo6vEq0rL/r0UieBTQfioUjHu4l7GRuwBUUxtUSolkBIqjUPYuNQDCK
	bwbmHXE7/Co5ME2a6W/S8TZfPd5Zl+KmjpieOFBkTBtBr/YBMLwzXcg52aNt7wRG
	2uC2cMcHoU3RkG1BTOOcd6v9bQb0PVFihUbBJK4kiETzJJHI7P82tbVHj5/1boF+
	j8p5QXHlaWC1iyauSs0Ojh6meTH5E4X9/UJVRGTHN01CKzemGV+7aTpkcBq72O9P
	yXHPGlCtwP9y9J8h0v31QH/RVTU9BbKU2LgwiGnbmnsswA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34h95nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 17:46:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5675cb317e3so1384801e0c.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776534366; x=1777139166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ElieMQRQ+IaCgird5S6d7Z0R9V7rrPa/yv+ivDtIYE=;
        b=XKI32qcnatWqdTjbwC5lNT8aVzaSiJT2CGNUk+f6oDhxOWkyWDtywrePjTRQWFb5v6
         wQDXRvYz4EUCxZ2oC0OWh5Yfumuqwyd4IyhRkCvVVjxmk3NNZ04rwUswDuuCw84j89+x
         QDygrQg/i/R1TPWn0XqwqttFoid/0yDbmekFsuKeLKPGdxWiMMQLqMb4IJAz0FAHnVYz
         mMI/9ogJvMT8zAtexst1r+kou5na4fUWrS90XlA5UQncaRLPiUztCrKwCh7U8gQJkaGW
         Mdkf3VYrkQBcy206BGZ5LQ+QVUjlyig8oDnfg0G7Gu5QpcbTgg60btmpSXmJK/gz62yX
         M7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776534366; x=1777139166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ElieMQRQ+IaCgird5S6d7Z0R9V7rrPa/yv+ivDtIYE=;
        b=bMm5hxYI6Teh3HOMuNm1IyMN1xREKDS9EEix8RmDIQz9IowfF+4Z1qHDYC1ZZH4r6G
         8felwaRAtM/qKT1+87cJf9qoPI5saj7hHaEyvA6k5WMPhTt8S4i/s9o7yZzb8qa+/waF
         6j+HE82JhqEoS8SeL+Vq0HDwwFGsd7zyjX+pwk1OSqR4oqh8n3mdlpBZ+/+/Nt/Yq+6o
         r/g96dUjynI7RWHUkLVud1pjNQLx5dccI5gZqT9opT0satY6g+cuwAFAiN4NbZJxcRgq
         rTJB4yZVz6QuyhTWUh8a0x9Nrg1ywN01TOkC66xamEr6Wn+QH9F2ZECg32g8yw2Z8OBT
         1tqA==
X-Forwarded-Encrypted: i=1; AFNElJ8fFeVOsnxtrOUuMKOmvhuzz73U0jV79GlpASEa/fyBCSoPw1kMSFsCMavhrqdNT9J+cvAbrZPYbww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy25myDD0TlaAHq+2BpL/fUMeByuQaWgCFc/QbUaAwPb7AfaiWx
	RvzhkZ6gpoe94+NBNW50nIAEYh8Pt/dtHPk6stN3N2DYZdFruDaKnBqXv0/YpV1XD7j76cABqCZ
	NWRZIlhkDHnOIGOOFLuoMA79idPKOW8ps7WApXsnZ7xQqsTZ+PvlhGNCPRXOapO0=
X-Gm-Gg: AeBDieuaOouxJ4owVH0NAnzzTvpYN4q/f/1CbP/BShwbJbdBEN6TXa4v6FJVFrKJrIx
	ZRwopM4Dva/g5U5TDn7Q3e9qmnz/N0E64d7miK3McLyEuS2PvJBvrhy1sOB714IeSMvRFpnC+qH
	+D1Ff72wQ5aEgGWEx0QAZt2xoi+ug5zMTgkBd+K474qKcX+TSn1O3zGR3B2hRZU59OOTp2aYodo
	9EWvBPEZsCrJnNlXBviThGOkwJZAtApmaufRYHKDKgJ/hnkorC+S0nvSnkTW7+PsWXfKjb2trzU
	u4HdLQSd0k/LQK7/YCbqGV1ogV9nVFGA5wXQdWW7gbMC5Gc9zHjsp999xgsSGMTZyp8qZ58toAV
	uQEiawGGlW+41nNfCiuSAtkzP8Vfv3NACnTwbl8u/zec9/iCWWga5IsSYWFjfN2t3IAWfeRdTXQ
	8lHZIcictJ4g6YcahPETXRui6X1VnTZBX40wCSfJ5yQcKh5A==
X-Received: by 2002:a05:6102:1622:b0:607:97ef:4dae with SMTP id ada2fe7eead31-616f68d7659mr3519434137.16.1776534366334;
        Sat, 18 Apr 2026 10:46:06 -0700 (PDT)
X-Received: by 2002:a05:6102:1622:b0:607:97ef:4dae with SMTP id ada2fe7eead31-616f68d7659mr3519427137.16.1776534365852;
        Sat, 18 Apr 2026 10:46:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5591sm12047671fa.5.2026.04.18.10.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 10:46:04 -0700 (PDT)
Date: Sat, 18 Apr 2026 20:46:01 +0300
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
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8960: add Riva
Message-ID: <itpbvjiszlgw5fibftm34ua6tufbiwentswju6npwyic6crnup@7taarqd37zva>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-9-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-9-007fda9d6134@smankusors.com>
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e3c35f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FVDmf5lRyKzVLZMU-LEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: CAVDuKG1OFO-BiOkEHHVnor8Err2x6IP
X-Proofpoint-ORIG-GUID: CAVDuKG1OFO-BiOkEHHVnor8Err2x6IP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE3NyBTYWx0ZWRfX+eWP/F+4n47D
 6nbyY/Cd21arbv11VWPe6HB+B+p8ZDTSGmlm0VS7ZNsK5KyA4AdqqLzj2d51uUu30iK24mB3KvR
 dTVsSxOPJ481XfbgRkKVoq9vWpzSatbm9jHTHVCo7xUKfiZ7fy2x0KFS4WqnYTt3EyTKOEoaR76
 OCwdfv4/2CuRaFKkrl1Krars1DBbwGJ1nG2oh0xpwcj0fONeUHrrYqnEiO5QQtwVav1WXnUQtLt
 sBidbbt33wb3zR7p66jfB0lXOx2shvTuX55L6E1eIRGby4Ga3F1Xs8M/mPbwgEDAUJcsZ4K/Ala
 qyzwpSxWCXOciBlzwXikFdEGupWkJ2Nzg5paKfN7mPj7i1LzG7aBtx9HLFuZUnlMrb7op6RLiha
 a2SUdqMeZWYjx515I7GcAuDkQ4ypNHSr4gjSsKYK/a7KbLaUgsKLgkx0a5sfCMMhEI6zDRcfJqT
 nJ/ZPa4Oj55Eck1Lfmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180177

On Tue, Apr 14, 2026 at 01:55:36AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add the Riva Peripheral Image Loader node to support the Wireless
> Connectivity and Networking Subsystem on MSM8960. This includes:
> 
> - Reserved memory region for WCNSS firmware
> - WCN3660 iris radio controller
> - Bluetooth and Wi-Fi sub-devices exposed via the SMD edge
> - Pinctrl states for Bluetooth and Wi-Fi power management
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 78 ++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> @@ -456,6 +489,51 @@ saw1_vreg: regulator {
>  			};
>  		};
>  
> +		riva: riva-pil@3200800 {
> +			compatible = "qcom,riva-pil";
> +			reg = <0x03200800 0x1000>, <0x03202000 0x2000>, <0x03204000 0x100>;
> +			reg-names = "ccu", "dxe", "pmu";

If this is going to be resent, one item per line, please (for both reg
and reg-names). Align to '<' or '"'.

> +			interrupts-extended = <&intc GIC_SPI 199 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcnss_smsm 6 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal";
> +			memory-region = <&wcnss_mem>;
> +
> +			status = "disabled";
> +
> +			iris {
> +				compatible = "qcom,wcn3660";
> +				clocks = <&cxo_board>;
> +				clock-names = "xo";
> +			};
> +
> +			smd-edge {
> +				interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>;
> +				label = "riva";
> +				qcom,ipc = <&l2cc 8 25>;
> +				qcom,smd-edge = <6>;
> +
> +				wcnss {
> +					compatible = "qcom,wcnss";
> +					qcom,smd-channels = "WCNSS_CTRL";
> +					qcom,mmio = <&riva>;
> +
> +					bluetooth {
> +						compatible = "qcom,wcnss-bt";
> +					};
> +
> +					wifi {
> +						compatible = "qcom,wcnss-wlan";
> +						interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
> +							     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
> +						interrupt-names = "tx", "rx";
> +						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;

The same for interrupt-names and smem-states.

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +						qcom,smem-state-names = "tx-enable",
> +									"tx-rings-empty";
> +					};
> +				};
> +			};
> +		};
> +
>  		clock-controller@4000000 {
>  			compatible = "qcom,mmcc-msm8960";
>  			reg = <0x4000000 0x1000>;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
