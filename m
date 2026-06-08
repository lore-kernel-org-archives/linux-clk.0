Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3DF30569D
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 03:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887923; cv=none; b=H19DHbsOrKIeZGtNVGQYedSzimPeBloBW6kFOAY8aak018wWjeqWD/KRVUS1Qo6vM5fqKEZuze+Xh8FoRNQ91QxcJ5KkS7VU2vzf4ndx8KYN6swgHfqq1zaV0W66t+wJZ9b9dvBLvfN/EnWpGlJIHXYbjbo97kR7wV7C6fAwenI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887923; c=relaxed/simple;
	bh=ZzO+xkhtMNBw34NZJknOUCTuwjS4aaa3c56ReHvEvpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YM6Py2+f/3xycXz5xkdrUr0jpJB+KBTlMgOrqm61I6OhClaP9J38PREXhDfx/Rh8LifMzjyr7R4rvNBqj/zLWEy2LcPvn0Ts4OTwP92IDMefZBO1fLP00Kwzo1REKIuzM+oJlpwOClwI3jxtokiTIwGiU1gVrqHxRdd/r7C9504=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQ6dpV86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmtkK2tI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQ6dpV86";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmtkK2tI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F3gP1471433
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 03:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u6fRuSMi07wfs/X3hr8ERNVY
	8T5EEOC3T+9jm25RzpU=; b=GQ6dpV86/pJhcn7NpdSOIJoNuoltluceU51eZ0Ae
	RvZAfnNHBx0rm18CW+smYpfsfEjksURe+mleDAb2k99IpeHdU2hoR2M3iQr5/smb
	/mIYzuKdMpX7Ch5dRTaIHDoUZAOtIlJF/1MLJ8Q9YneV/R9+AcLMrnx4GfknKwug
	ujuhUMTBNa8mKUtDFl9vET8Eb+S5ZLy/lp6ESYsgvselHuC0HVuTlDqA2W5ci/sa
	ji5wLCQaKG0DIW9hzxptjylAcAhTya2seGlNuQDZ2padE88JBJXAZwemEkd7/yQ0
	waagx2MC4zOf3f8yPMWdVjGLB2yzp/vZFs5nZUIEZHKmGg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgw8d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 03:05:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a10923f7d7so7211847e0c.0
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 20:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780887920; x=1781492720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u6fRuSMi07wfs/X3hr8ERNVY8T5EEOC3T+9jm25RzpU=;
        b=RmtkK2tIoICZDU11s2uk/zAJN8xpnkobH+IjmSgsP2JEGp0v1N+jlIz6vvdF6RQ6+g
         zmcQrBAQdrRL5tbOp67iVCtxmp08OqYfu7WoL2qsQDeS9R1uzFcbAYpfy6OcurtLrUhs
         bEj4s9LnOeB4eqaq9yY5/99IMIoFXIHduOatTQqt0KkS9XrO9sMsdJg4b5SAEdZ9YQLX
         jBKqljaeRZafEBQIZd7B5Q+WRhOCskbc19DNaxHkQj47KIXk/BE9jKbsB3wsmjB0/n1v
         /wAw+JEdBlIT0nsaqwRNW2UuwgdSbQplBTjbx0AhwzOeuWl68DtIbsuBRaAyb0/UpnZS
         Pzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780887920; x=1781492720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6fRuSMi07wfs/X3hr8ERNVY8T5EEOC3T+9jm25RzpU=;
        b=rAtSUjNxM7EjCKz5wFnxNsOAGMUTkji9LVGvLS1ehbQHcccT6DpovsOqSPAjaGJuTK
         o5/R0mAFdDnva7rpsYhNjiKKvB9++SJp+K7RTnoIZJdEC9K/8OA1DUK+tIvw6i5A/QMt
         /KupKhkHaFCTE+6KRvMbNsUcAokH1ErmS4unl5oywem1WD+dIoz/ZaPfAkSa4tzO3syP
         209IiAZc3nhqQg/YVxTJiUyuWvIJA/mn4YuYVz0CTByx7n7xqnxZ0aa6tx4/JuOrsjTQ
         QLRYoY0epqkKPN9TahmJAN3cFBC/TNlK0PMMHrOVMZXXZCEEgmq81ikhzdvIOTiYEVA9
         5HcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ih1BTjksUM8BmieE1HlyrYhEz5Ku/JYe26Fu/UgiBwF+2YK93902kRf71k9+RuRZFs3G2dO71MuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAvFLvKpfCFtcDwXKG9fzV8drUCxmjtD4yZ3ffoNkmfu60mC3I
	tpbnRaM4GYaMgxTIypW/nK2WyEE6o4hTecI5H2a6mhXZSdowz7mHs4YEtEuTN34laVr7z3F6TdV
	YknEQfU+xk91kNJR8DbnMOU5/mRXcSn2hW5kguyIViprUTYTTTsADbsl+OOHbVFilrhfhuPA=
X-Gm-Gg: Acq92OECtwDYizw72p4haZQyytNU5Q2De/3wOSQMeYFx2JMQyhF4TKW7+OfajZ8dW4F
	Imi+1E5ZPQakyIbmRr/HDu+VdhmjBLKjMUhyk/Xxu2NtDDLqW5coehX2sGXtNIi7HWQpFAaq02d
	g0Co8GiYZs9z//NhIP03VHNdmDY9BkMJe7oAoMpCdxx4txpt/PmCNyuTv82cEzBcBje9QG+UeVf
	lnE5ZEVM47vy8ECQPUS5kC/C++WDojmcDyxEPAy0hZCQNXb0OxXcUZtzmG4AUZvj+feP+2FxsXz
	uwvFTKuVRx6i/MWlxxILgCrjPwNeHmyMZ+q6i64yICnwK11mQ5yy5Iws9f3TU2it6bIX9AeCLFo
	cqBdIGGZQ3hx6X6hVqF8rIs3wEOv/LgjgQBzBwNMXlDIr/mZeg5JPqg8Ec3o7bTJcZD/Un/iw28
	q7lFOKekC0STl94OBRgUCHUaYwmp5zJ+5UjiJMpFQ2rXnbKA==
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr3362637137.12.1780887920122;
        Sun, 07 Jun 2026 20:05:20 -0700 (PDT)
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr3362624137.12.1780887919706;
        Sun, 07 Jun 2026 20:05:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990344sm3450395e87.65.2026.06.07.20.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:05:18 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:05:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: add lcc-msm8660 LPASS
 clock IDs
Message-ID: <3zfrwk7msdfum7kmmao4szpie3gtcirp44kjlpcweik4tnfjai@tl6n5fvxircs>
References: <cover.1780148149.git.github.com@herrie.org>
 <942e4109a23de49ebd660272b9c6a5ac1677637f.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <942e4109a23de49ebd660272b9c6a5ac1677637f.1780148149.git.github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a263171 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=cTwmTnRGAAAA:8
 a=PfdHpp1dQluSkMl_sowA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: h60_CgCaBT7X3__u4aqH_9pm6NI-1N_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNCBTYWx0ZWRfX8kRXObI6MXHZ
 /eMKPOVbzKP+Ws+53su3XfJ4bCrfJcHQHsdm/r35ck9CyaqNjVhiIfqix82i4dZ3R3iyeLxlaU4
 SEpBT1ZIET1nYkg62uV1Ss+ScQ0G+wHQPO0cl8K8V0hEnu36XwyVvlJzMOkQUYealwpFoCSn4mk
 vk+Zoo88qvwfPWqxA3Ek8qr4MW8+EL/BUvjqH0DcaVKCuxzUz3uMRu9s3EaRvS0qb7YigUt63kN
 d4GACmgRy1HTn+6EyQxMiEwdVlEZyWZHj64pv0tGKMPhWSW5G4cJ4yd9pRVFTcMSgZ9iLN/owiF
 V57tlcRno9ORmgOGe64rv48Bs9nftcoA6AE8n7UndBCdkjC7aU5aFl/dZ4//1VQNVH53bD8E7pI
 j1TrcqI1JTZQGqr2XkQ+eZ0f+CZsb1PT0kRb5r44jSAuVk9j+2LPzxZRYQUAH/4xMdeRl6T/ipW
 D4H9P8My31sgfzr9ZtA==
X-Proofpoint-ORIG-GUID: h60_CgCaBT7X3__u4aqH_9pm6NI-1N_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080024

On Sat, May 30, 2026 at 03:59:57PM +0200, Herman van Hazendonk wrote:
> Add the dt-binding clock-ID header for the MSM8x60 family
> (MSM8260/MSM8660/APQ8060) Low Power Audio SubSystem Clock Controller
> (LCC). The header enumerates the LPASS clocks consumed by the
> qcom,apq8060-lpaif sound card and the codec/AIF nodes downstream of
> it. It mirrors the format and ID range of the existing LCC headers
> for newer Qualcomm SoCs (lcc-msm8960, lcc-msm8974) so the
> drivers/clk/qcom/lcc-msm8660.c driver can be hooked up the same way
> once it lands.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  include/dt-bindings/clock/qcom,lcc-msm8660.h | 48 ++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h

Full bindings, please. You can extend the existing qcom,lcc.yaml, but
the compatible should be defined and constrained.


-- 
With best wishes
Dmitry
