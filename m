Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A36E49481B
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992257; cv=none; b=pyWt6Zmckna0LjcigfZpXsBLX6VyPHre//CPMMQmf2II5YXnH/q6AknGX7ce2Rfkq5AuQ7/AxGQP8nmYGmnyRaYirq8VjODoi4Cm/OGeWeK8LqwM0V6Qk5gNDI7FFFLt5RSHnVLHHR81Lb2OjtX+DGOLcLXxUUiZ8gYXObpuVKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992257; c=relaxed/simple;
	bh=XRcFq7IuXH9kC8tr1NldVZmFxCs4PttO+0bLD5IWDAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTnIwqAeEc5K70MrgsNQTEHAErKMEHpE0dJJpZl704zDjxA7T+zuiIEMEqqKg3UQLgoEsvugUhm2A8ycB0B4ZZyH+pawiS9curl/jAN7f+vbsCaBNWlkROfI3tsugsrbc2aGMz5UlhpnsYY2O8L/CZJCs19+MrO1JmIhHzSUT8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6isgjoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C03+e1qc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6isgjoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C03+e1qc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdo5q1217731
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=enveY9jv1nThYF2kaQKkUFzj
	DWdSqrtaseNwSFGaCr4=; b=U6isgjoZweeTIfcGZSSS8o3qu5QGVnoDKVHcKiWU
	u8kwH7nSD18DNNuBZqbCiGyq6/lTRhZa4Wu+O3Fo7ECF3BWs4PvTBBTmzSAIOGVN
	bTZ6AFddbVXCejQnGWxk7RkPrOJ+fL4Nd8Iaaqi7yKylPY7m7fJpOzyouMfzQwi7
	7ujrCc1SgVZ+pmZa01znPs3/bM+nko9Wrwi0YBMSxAqw15RpSu2kV4GbJr8IChQX
	t4GcNBE8oaxeF4RqGXkFPt2YF/9ydAnLQzA7QN1McnpSBw8yUo7M0nNSm+CeeQ0p
	Gq0CL5pyEFJTdBobBRSZvzpb18Zy29W0+zbTC4rvEJL0Ew==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01194rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:04:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78830f4bebaso768740137.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992251; x=1790597051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=enveY9jv1nThYF2kaQKkUFzjDWdSqrtaseNwSFGaCr4=;
        b=C03+e1qcPnnSqqxLOANSQaQhtikgxGMka6/FfHPvbCpWzObc1nWOBmWU0d3LkbpTSk
         8p0d4ceparkYAT7PX3hbNnTA0npLddQNBwTf+xtvs7CSjAIUV0Lq9V5g61lWHgz/FThr
         /NwdBCd9Cd/PODWypGLDrtZ/zDeo34LLd+7GpYsTUzEqVagcAqRU8R+DswYUog7kwhJU
         LY3XOBzEWPFNvo1822Hnkg/PRFKffBqykURn71YSemceNaX03OqsiPajmCZBnNoZHxVF
         J2+VEHipXKNHryU2CaZ8/Nclt1kDiwfZMba+cJCLUKYBENcWlqc1vB58naB7hN1ceuSW
         ftFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992251; x=1790597051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enveY9jv1nThYF2kaQKkUFzjDWdSqrtaseNwSFGaCr4=;
        b=LkkajUBsVYmdhp5uqNSEsgt8PGMcOpdhvyBlY8CzCq2xm/GRtzmchYgUCiWpT/ZPfA
         rK+DpN9Si341gvzwDuzN78JZAwnaU/LwGNoAT3zZxEZvPeBtn6IrE9pMM6JOesyf0LHj
         HAGF4IE2a8mIUTn8mVrWjvdfEyyx/uz/56sLU1jKtkwOmvShpAvmas30x2be0uZck5D/
         Kzc+Pi4dIFZ7UhoHjfMXX5RuQ8hFysqrV5ADzd7W4zX/sEbp3JXPszBRHo9zWXJUXkeZ
         kROFkcgdmxMN67vMeIZ68vM0H7jWVK9+XwcrOLEmpcCYulYaLnRX9CpzITZrdVrkidMh
         O6PQ==
X-Forwarded-Encrypted: i=1; AKwUvByROf0PNKjl2rEu8ji4fs4beiYFYUGsTx+lBAjS1vG/VCAVWwZGNCHtDPGxU3T8wzNo8NglFwD2wZY=@vger.kernel.org
X-Gm-Message-State: AFuF++m32UjTd9RfG/IiNkISoFAL7wfX9ROJslDUjxHUoKTCmNSjLAoV
	5iGaMzu05IVtFJEbMOkIxyo6wt7VqGLywcu9HR9fLr+Dxla7pNcVJ2B34hJfbGEKL3PpJA7huLy
	5w0Rh2qcWBpdDLxQRTgCTEQOgrUAVAyiUuCyqO3eyKjpVEXVnAvbRbVrPQGVk2CA=
X-Gm-Gg: AYBFou0tcdQWK4LRk8erundgzlwe00LSAn5j+wsPwGbzD2xOxW2HIm2RgQaP2rjqw50
	fIVTUge6qvTVZAFLQzNGdgVVdqtJXpAvLwHjNtaQWaUfdoA2qAjB8cPEe1OUMHueT6CLomcJRxo
	jOL7iHYSCmkcgZ6tYuQ9nCPruNDc1UrBY3k8prwU7OLz7nVF0VqaQeJlfOqPCvclrWlzTlVTmH1
	OeNQB/zzvHGr1uMokWrx5Hsn1yAW9boWMDldiJA/WqX9KMQJVkd07PxuZcDGq6lxVfCwBRP1L6x
	lXIbNHGseigihWUsU+O8Fk1jRhCxzWjnY4M+EfXCsErCh0kKvPJCZw55rGGR2scsKxBzMPUJ0jr
	Bn/udYw8izq6hxWo=
X-Received: by 2002:a05:6102:4244:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7a719aaf7abmr1670601137.29.1789992251080;
        Mon, 21 Sep 2026 05:04:11 -0700 (PDT)
X-Received: by 2002:a05:6102:4244:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7a719aaf7abmr1670527137.29.1789992250513;
        Mon, 21 Sep 2026 05:04:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eab91sm245354285e9.1.2026.09.21.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:04:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:04:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 06/11] arm64: dts: qcom: ipq5424: Wire up USB3 PHY PIPE
 clock to GCC
Message-ID: <gafrnwlti6ojl3nrifhejf76voamomuthwuikfmbkcot26fe6o@5uzaftq2y5mo>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-GUID: nNAs8FJlUe48m4OuHElZuRhUWsRoeKFv
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab11d3b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KhyLHX4QOuxJUOlieskA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX0MsbJuZ7My6H
 eUGkw2sFzt1wu3zpZJbgPrtWpSsXd+Ofc5jtzA0vj9SaSpfWIbxZZmgshi5pcjzxhFtCOb8a6nI
 KT2MmmU4tsotMtOXEkAorizi/u+EiEuT1EI1LKyGDXmn+30AGA+YCzLAjxBg8j3LrDzQ+/wgocn
 +70qNQjehdNHCiFOaISyMNvWdhX8b2hFnvWS6xxbwtxkANvLDDNEqW0gVXUypBlkkW9ajZYPx6I
 rzPVXfBpsj+rKzIbTvT/YZPwLAVVussXrdeyZ9rQjJk/RVHNHEa8xvgjb7sHtSZfpJUrh36IthB
 LqjJORPfUIjW/CYMS0uH+zgVyjo2Iv4wTm/JcRc6hc4TkzWFTF6MLhJru+mFlz751U0a1/Ker1I
 iTwqzZy97lq/BGkDCOcfdVJwgwWfarMm/K3jUE9scPdREY9oAhuA1JUsZQA68Yxlw6fqhfijyzb
 z/Jfx8+mJ8A0Z5phn4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX+No3klzboB1h
 +qdGStae1sN5QC+Hd5w5F1+6y9lN6Xq6PwqYVALU+x4oXn/L5rJbvh+uvJAWdt9RwvioCFeQbwa
 OdxBCcaDOgc/cqEC5dLt/lyoio7jRrk=
X-Proofpoint-ORIG-GUID: nNAs8FJlUe48m4OuHElZuRhUWsRoeKFv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210175

On 26-09-21 11:49:39, Kathiravan Thirumoorthy wrote:
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock
> can propagate to the USB controller.
> 
> Cc: stable@vger.kernel.org
> Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
