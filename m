Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D03131196F
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776530776; cv=none; b=d+XgjhZw1lz5t6vcx1hbxma/uqVi7MkMVhonFRrDj2K2QFguJEwTrXNLsIXi1RTq4O5TUnXU9+yWagB6PYB78UubaVui44/ZjGfTTTRR/NwxVs5FLSTUFOf5tLfUswsn80nsv0DOQVi2W9qHi/v7OF9rXxaYaEkQW8W4ioAy2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776530776; c=relaxed/simple;
	bh=Wp5uo1kEWsoAlDaB84RI1CZfMuh7FTkZNljPadpndCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=my1RtgSeoxTZ2Dw46fwy3F0RkKXMlPQsZsfefh2bz0tQkg4R2PfIoTwZORzTnJvle1zzWRRubM3kxdoOdhd51mIW4mZjXtGMC0tYMwOtUlbKWku+nxciIZwGk/Op3m8pIGGofNP50v1KyHdPDZzNO51o5GBKsM0wajGFeUVgWh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMXNrOQB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSJaPWR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMXNrOQB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSJaPWR9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UXlQ1283952
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 16:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AemAHZIONmX9Bx4hX6o5KMIh
	YVIU89hnctinbw54IEg=; b=lMXNrOQBbXNP5YWXpnI1rhoOIHnhDXKWzmvN5xcg
	fJUwXTY9lNj2l78wpeMHLHglBiWkwF1uaMJUjbVbEkhqWUrS8kItPV9vRwe1d1Oz
	08IS9x3N4FuvrV+YilWYQ2tw16vVo/eurdYF2FQAbTwRIJIMO4c4BTRLwohpRFGG
	0uX0K/vIXF/7sKZnsCF6LNYmnSEkq6+S/Qx5iCVM22370AFTWHcypdJE9hrSelyI
	/OzeMlf8a6zvPZyqMySHK7oVLNSd6gbSodPqAcXJhExXOliA2vl4obXJ7dRS8Ieq
	ikCPd7U4BvtNea9NZGC0y+ktA4VmVq+nBbk5Ux70K9zTNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fs84w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 16:46:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so42069321cf.3
        for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776530773; x=1777135573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AemAHZIONmX9Bx4hX6o5KMIhYVIU89hnctinbw54IEg=;
        b=FSJaPWR919mymUASTA5baUc9HNWaLL2lU89VDOUxMCPBFVEq0g9K+xiLy2sfMpKwT+
         dkDzEA5CGT+13D6UYii8Z+k6xh4LtR10Lb5i7/H5/f7Q9cl48nIJo8ChxdIyReyZIvmU
         WDMO72KTv5sLtqg6ejtZEn8EbtBygMAnydp3vL+XHI1c7LNnTA8wKvMqzhUZ7U9ozSsd
         QNOmzN6+baHeomOatIkWH1nBC6odetApZZTYdOBe7Kk8FC2bDqmwNk79lQF9WDtb6NoQ
         cO8S+Tl/AFn5V8JZWhAOjd9W8pZuQHqOaIM9pFI4iJ3w4yIqFUJelJIHzLf/vXx5hAxG
         5O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776530773; x=1777135573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AemAHZIONmX9Bx4hX6o5KMIhYVIU89hnctinbw54IEg=;
        b=nPofBZwDCgNots7YLEPVjNPoxllJohCFYJl8mi/aEJaLCj84JH0dJ6kZP+JJ96qK03
         uIRjnMNVUGHRR/oOmpmGGBcce7AACCTq2hczb2l7XuZaTudAR977Pb2TN6Vfnr8iNeCj
         9ae8Hj0gT8/AclC11iSmw/Jkc0cCl9r7t5dVyw1Gw3HSYAUAyqwthrOHXpaH5IloBbzM
         MA7MDLF8MTV8faL5kstanAMB9b2lBaGVcINJSKYgN5S3+wo0tWd69O7LeT4vhPo22Nym
         IqYnSoCamqChfD93se5dLgoR4xYsTy1qCXk1h7uGPKhXqKMRgoQszge35AjLrnAtmONl
         K2Xw==
X-Forwarded-Encrypted: i=1; AFNElJ/MVHh5iKDhCuf0p8nIYApVK7y9M0Ry85Fdp86Ggno9IAbBDWCkTYH01ZP7gXtH9ThRqxsgX6zJwxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjLl0iEqDZQtrq2CiEJBEhBK1e4745GSr4VK4tBvgWkBhW5t9f
	azjMje3GMVhO/rB857y4ZFYXvVGPMI0sTkcneGUC2DDbT3zdgpPtNoaoBocliAPb0ENlIfXamZW
	TsvGiAfbVqJLdtiQqVulQOBLNPWcDOiOpD/ZJlMP48AhW/E5SOmIzPMkARCMCgqg=
X-Gm-Gg: AeBDieu4/i9ZfENkLjQ5UxbwqckWHTGsmukXx+5cthZDln2ow6JMHAD8bPzIpp8k5vz
	CCQJlllTQm2oCDOcfJiG5hOH7gpumxH94d8VhrznqVTevhxRD2X1OUghC/A0n1M0pGTXmDF6NQt
	wSV9J8AfdxPVG/xJevM7gwhO2tyga9VQoNx0tZW7Gj2miSSkCy5wbUVFOA+lCR0KOmccA6qYR0v
	sdGi4faHCIbAuhMNk14BC0AwfBZaTxylolDCRPL3irqgpRgXIjvmNNTChi+qKqkuRs1yWx1/tjJ
	z9JaQpMqXynY+NS/6rWDZolZCCM/qrmpX23TF64RoUYOSlb3yLEJwbdnTCB8uaedE9x9NnxEIVk
	8704Hveh6b/wrUNWLybue+Lfidr8Vj3uVfDr86paCkYua61VWDwn1LtBAkX6if14rLrhhXKMxQk
	mHcj5n3oJzArhwbNaamKEMJkRwgY72RjB2wd8DeOX0cT41Lg==
X-Received: by 2002:a05:622a:418a:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50e36c15da2mr110952841cf.29.1776530773232;
        Sat, 18 Apr 2026 09:46:13 -0700 (PDT)
X-Received: by 2002:a05:622a:418a:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50e36c15da2mr110952601cf.29.1776530772833;
        Sat, 18 Apr 2026 09:46:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm1448060e87.82.2026.04.18.09.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:46:11 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:46:10 +0300
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
Subject: Re: [PATCH 07/10] ARM: dts: qcom: msm8960: add SMEM & hwmutex
Message-ID: <2gydufud7lykeselo7yca3n5jydtbzephhjcpm4ek5i6vj74h7@b45lfcheohsb>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2NyBTYWx0ZWRfX4oELq25iYsHR
 9INIiEHGI856E5CaLVF3a7Y+zqgER3NqwFcaz+5uwtqIVCW8OSjIhVsLGpXRsojKlO+I70CSghk
 6RFlp9mT3ONXt/7hMPdTyAodBKo0BtiVougHz73eiU8c4s/H8PCrUBNPygg8m4Bcr34KYcRWqqu
 K5HqYkUCNYHg4wr5b9e0jLub3bQQ1K8NJAsNsJqU9kD0OGQSETONrauiTXzUMTAK03NES0P3zpw
 QCUB1s5msf5FaM05N3v4bOEccvZUL/cdNT+4XJSvFlVKH9aNyJgTzmSkobGgsTaBnY93wC+sNPZ
 I0cA5cAeUUNN/eeq1o63heyl1OBUj2tONClP7eyC9B2WckSbaAmyT+Q2Fda27Qog5XPO0G64xpf
 H0Avn5YxTGnsygwnAH2JD3kXtq73cKXK63XITVfVB/ZREO5DXxErCQmer7T2DfF1XsZkKsZeG94
 cKU38SBd5cxO3Zt2hYQ==
X-Proofpoint-ORIG-GUID: dfp-TS45-sT50t9BmWob_5PboXXZa-HP
X-Proofpoint-GUID: dfp-TS45-sT50t9BmWob_5PboXXZa-HP
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e3b555 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6Xm4nHdHo4a8rT5D54oA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180167

On Tue, Apr 14, 2026 at 01:55:34AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Enable shared memory communication and add the SFPB mutex for MSM8960.
> These provide the foundation for inter-processor communication with the
> Riva (BT + Wi-Fi) subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
