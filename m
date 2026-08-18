Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A079C3D25D2
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052714; cv=none; b=JmxjHHhDOLDn9YqHXN7vyt4Tsu1v1j/txs4/dmuPvIxavYWSTr/GHfKf3jpAI+DUKNtjRxQegBivllZzYKp7SGdiZGfD6jLJdCUAND021LPL0Eok5KBmzCC41nFT8LQcdWoKYvFDh1Ct4gkpIRqem6jEiy8iGMf05acyMulDom8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052714; c=relaxed/simple;
	bh=dTMkw80f1Tv+3rvx0Re1hQ7fMXnuWq60opG2/27MNlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdMedoaSyrMPxTLaj1TwFxOWRL2/FHmO1xvhOsW/8eEu2C0xdxe7p6dsiwmrkobrokLfpLdr9AvXPJi6hpcjgOFw8YezMg0vA7W8DTOV75vcmD80WcKQdpZBH1ucg3q7NrnoR5Nj7IAh/Tdk3uDgab6T2RJxl4YwQMNaimMmI2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STh3g4Is; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktELidq4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STh3g4Is";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktELidq4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABik5599463
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1j9tERMxb8x/UilY9s2W+k0K
	iXo8GD+EWlKCA/SvldM=; b=STh3g4Isn6yZtfBha9i/CeCkzH7V3UkCCuU4IaJR
	jjjRE+m4iB0DIx5tLkwDmCaWl6IwFJ7So+E3bZ7xJ3azHsn0SmrW+zRYHusbIrNn
	RtxNZNNwJnq1KNJiwsYpByqIwh7SYQ65Kf7g6TS+D8f5uJ+fvkHjYVkXE7/5VpKv
	g7kogyXB148Pc1VPs4nA7vZQ9tngVtbNM9wQu4DZGmsSH1SahPp1yfi0AOfigax2
	57vY9qvNYXgh5H7TuOZjkqc9saXKRKmmBqSSPwET+lDJzPZIZiOosC4XHxP7afvH
	hm3+6878NVx/P8pdFm8kXeMe/xVpUtPVmfCIjL6y9omK4A==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtt3c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:31:52 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81bee860fb7so152241677b3.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 04:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052712; x=1787657512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1j9tERMxb8x/UilY9s2W+k0KiXo8GD+EWlKCA/SvldM=;
        b=ktELidq4BGb8K/kZj7Myv6WsAL7uNmbR2Xh1SjXyNWWzS6ZLGWdmDOqlGPizOwqCa8
         Z003OohFXwP6pOUaVeomr+8BbeekyWTZ47quCThz6ZDIUU8sfearYmjRSAVX1xwlERp/
         cmhS4JPq2lcGNVfgMuDhLhKG3gTc55kK9L3sqa15QkXM9cNcvCWRNynyCDAj7Ccu/dDz
         nsNDaQhWcwQokdxwHBs2/n7zkpGB7e1dsvR/XQicWr+P2A6lwP/n2mCuejptLMkN3pbu
         tAxLSJA9eRjONlRXIdofcpEGNqnC8bSrl1aFHwDYirWL5Ldzi/JCXWmejOsp6tqE00L5
         ZbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052712; x=1787657512;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1j9tERMxb8x/UilY9s2W+k0KiXo8GD+EWlKCA/SvldM=;
        b=XxUfuC2Ucd65jC0IBqrK9J7hksAd0L34cuCBNEt4NxFb/6MJp6qf23a/Vs6xeGFJ99
         8iC+xxJEUYh5hxbd9pphynvc3GzCEbWmiDDfLJL9DcULVhPw7e0DYBh8zJ/NrPmywa0i
         4KFLuqnB6bFMhxl4Y6bPqWGge/Yln5T9XOdwy1kQeTYyS9TqxY87I20LyIBhsZc0SuHd
         WICjn0l5lQAYGPY3EeuPbNU0KNTPNFsHpTNdI1vr7GCkfuPbyi7ywM1zM521d8PPdqkL
         8/RxDSZIIynB6tHfQSeEdwEKeV8jaWlrWMqr2IbU0VorH2auA2BSHDJa4KujhGV2b57d
         Uyxw==
X-Forwarded-Encrypted: i=1; AHgh+Rrr4YcFGqQYFTpAtccyReJSGpkQmLNRMunbaZ9Q2KC2pVwxn7QPVKD3sBSXPRr45v22XDg7Y7g9Z24=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9oBwcoEP9oZN53hEZBDCZLTtxey4njTCB0Fhx9djghKMiUiVu
	yeBIOLDPG3uIgbVECjlmHbyVGKWcD2We5kndHdVWSoRH6vSnd7Ar3PScejX33vlT2xqYOoJduaI
	Gm2xvwSO7H8lQ/QiAO06CHthrAOO/GfjKUIQ1DWBvV+S6lucV9lSup16dHb2q8Cfoi9xdMgTUzd
	up
X-Gm-Gg: AR+sD11i8AjGK+3aLxaxDxhpl5ztl4jmDz5urQq/alIJbaqOsMHYG1AXsCB2OBNc7Vq
	wGVE4fMfKYmdW39cHE0PUv4Fhf/M+Bw6hrejC3YihqJesksQ5GVskHalfS1jE4iRe7f2L0L9huF
	D9y3H0FDU6VvsPxs6ND93si4zJrwhig5Qq2DJdvPxTtd/MqeL7Koj6MMENaCCnpIgxHoCrFKXxz
	kq1nMfftkuZNsKauVLWUjR/48pJ2yPMQx8nLDml4pWpBNGnv5C+tOMwMSFkkEgIQw+DPXAg56GT
	A1Cg1H1KZAwU5mHHdTxZFRKEuNpuzqJ8CIHs6f1FQG9Wttue+isFWc7+Y92CjJ6Afna/CiOnm8G
	/eLprYlVKX4Ijmm4bxVSQeuqCw4/bPLc9uch5y42cT6bxu23BAL9VvArVYpSBeQh5nx47Q7G7S0
	Pyl+pnVs9tYdhY
X-Received: by 2002:a05:690c:c70b:b0:81e:7b95:c777 with SMTP id 00721157ae682-83714124049mr98714897b3.35.1787052711978;
        Tue, 18 Aug 2026 04:31:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:936:576e:227b with SMTP id af79cd13be357-936d234d896mr3499939285a.24.1787052350642;
        Tue, 18 Aug 2026 04:25:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1f1852sm11079811fa.38.2026.08.18.04.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:25:49 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:25:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Message-ID: <xh445x6lbr73cx4xxn4dkminza4bp2i5dibagq476yidfwy7wm@hjt2edzhkbz7>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-2-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX6owgL5ZpHp4g
 F6gCTdRlzAKY+LLJn+fZh/ox3DsBmVRTN6ILlwp1oorfqffJ2wuPlpo37aWyPhw/Edxi3QG/lzF
 uaKYmF0hzI7UGyJTK4yunkFnLys9Qqg=
X-Proofpoint-ORIG-GUID: CXaAP3xSf0oxex5oNlhUNIntvAANx3fZ
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a8442a8 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=PtJjGYLjQKqNYAnhcSgA:9 a=CjuIK1q_8ugA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: CXaAP3xSf0oxex5oNlhUNIntvAANx3fZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX+sg/KPwYrLyx
 ywQy9RdqAwwL34oppkJSzThJM3S8KkDW9M9JL2XB4yTHWm9H3KP5+7D+5XF9SOCreP54gAWRJ0r
 gGiz6W0jY2DoPLiZXwpeQQIwx6w4zoMytNV6z91twutWWmzovjot7sj0Sw2S0OzE6OcrV4mBaJ5
 hkHH21DBtznirW59OObsc2euyxbVm1RYwUe/WG9pwZVo0v+ux3fR8HWOgriVFS2q1bvrpjO9eW3
 FGKtKxmylIWOT+PV1XzZ35kNZAsOQAFY3/i+FhESxvhgM2Xm8RWniFahZtiVDHxcDoz61gUcgQ5
 1Xk/rUnfAqK5LwqXtoOQwgO3/y/C8sBLdbVqwC0s6jNbNWkh9f2VhaPSR5sUG6kycuoBOYDDxn0
 mi7PkZmLAb/C83uXXRAfZrg+56kqkNuAs/EaqhLqbJsKcErZZNagPLMwUxHbZfAim+5Ge1J6Bz7
 hfa4z0e1RWYkkpQATLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180085

On Tue, Aug 18, 2026 at 08:07:43AM +0000, Sreeshankar K wrote:
> Add the ID for the Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
