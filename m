Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B39D2F1FEF
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588677; cv=none; b=PeVpsCq1hrJLqaGi4Z2/rDxEke/Ne7fUtLxmWf9jbCdY3L5wb1E50xvXvuPpAh7foQZGsNYjxBu6KnCZwCBqpcz70m1tnDqGiHyXRnRxm/EGWFGp0Zhlq08haSFZhj9+w2knlbgkC1H3LkCf234nmtpG9iSVVHGyT3GczZBrXRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588677; c=relaxed/simple;
	bh=Ec/IAyAZg5HY1whU9HVkIuHkXU6cH1mANyRUHnDVwes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9+/THGqz1wGKSCIng8Bi7/OoRfz9+4RWXuikPM4h0+TYs+bCvQdEO7IK4Rh56kXXoZg465IPCp7ZPJk80aXejdQmMQWPr+uVvLIplNGMg78nlGdnZ7bXxaZLHZd/S+/L2Iz4gOyDry7O8uJxLsyacvxuLOJ3jXxMKQv8T9blUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiUIzcqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kaBAdEvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiUIzcqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kaBAdEvK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S6jr9h2943023
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ec/IAyAZg5HY1whU9HVkIuHk
	XU6cH1mANyRUHnDVwes=; b=QiUIzcqTfz37lmnCckn3wutW+3fIy2XOqJh2FnmY
	WXAzKDojC89P2Zw3XxKq2GWf8NVwlKWvyOIkCrQTEsRcQXBxzh+/KIyQ7h4W6ar5
	tbD+vC7IigbQV4MbqiFlwBMq7flR3Z5XMigCjD5wk3Cy40NMDQhg3aNOiBN5MEYF
	HjW5mXDCgQdb6lqDuAr2N1kAzMq/B5ZP2sFweX7ul9BRn0U8373NyQ4sHgTWYEyk
	3uUGfSvHSLecxshW3DVmWvsGqady0WiYDyPeRWZYmrL0PFQhj/TOG4NggFwaSpyG
	KH5h2oLX5niGqbR7m948vjyH3gcfNRPcOkrJ5JUs6YFHcg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk09p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:24:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a344b86f7so244197166d6.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769588673; x=1770193473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec/IAyAZg5HY1whU9HVkIuHkXU6cH1mANyRUHnDVwes=;
        b=kaBAdEvKP2coqSNR/sFM1JlKpfBexWtM0wmLFM/CbeVFdHVndcDTI6hY5IPrqvw5RY
         ai4+qcAcnMxI7gJ6xH7clfvrTC5W6FT2v1Mtax/V5/rIcgaZzdMV4FPQdRZ2AJRZn3R0
         eQxuPfsTlkgaaqKaMWDFcyclOaE2g8tOuqlWjjNusTLt2kL+JhM/7pylRCsCgflDB3V9
         RDro7M51Hcjb8R8uvDPqudd+vpobae0G8e4VlhPAlGYwf6BBmmgGNUe7fHluC5cpD7Jw
         U8QSFwmAJ7oW77hOY+Y10Jrb2XJxL8+dS+4ZjoaIJHoWVQirL1ndWFRXuWVn3y/A/5hh
         kTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588673; x=1770193473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec/IAyAZg5HY1whU9HVkIuHkXU6cH1mANyRUHnDVwes=;
        b=C/ATTNzsqV2hi9eyk/gXoUCNqTmwcXrPxW9Fjv0nhQxfJDrwTBEGOZzLyhJ2sIe+B1
         HgUvKMbQbEsV+pebZqsO8Wtzg6X5cPMc1fy8FVA2QeZNIeBmDWT7xNUdfv5rJg4stwLC
         I3/arBBaVijV84GxYF6t65Rdlr2n+2ptezNKbKFp8LdbdwAtgFzw01KinLKDyBxuQqnR
         WAsn61PlQAmDntKdBw9JM9K9b9AxfoZ9OT/Q5v1k6L5M5Rbynpo90udwkY3tokqhnS6Q
         6p/Pe6dIMgvqEpfKVTWucOn9TwzYM1lqC3JkXFz327lIibpu2yUunUOUVshdhTMviDb5
         KoIw==
X-Forwarded-Encrypted: i=1; AJvYcCW4njh467ARN8cq5S7GLFEXKINzs+xa1rn5PWuYhz0AKzGzyZoPZncOcc1SGHHcRuXPoLRuLm5j5bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQhtuNbxds4iQbWokZFNqNE3/2Y9TKDtyN1BVxM4a8FuC67qv
	W3otBoRdEIYYNe95/eci1IotcNWtsbP1LvYKu1ekodpIZ2xkOUSQzU2otB72lnJ/Y1eoUDQxMYR
	2TYryD1nmdV8xJEM1+bLGZwHslLnveiKVkf/mu7KiembyvCPPUJOENxHf8OlWCDc=
X-Gm-Gg: AZuq6aJRMchiMlOYVzlsaqS+f9ODGuoadLvVeXjXT6rv9ytihxt09Qq4NuB1jQK3vj0
	BjABBOBUdq2DLygtPRdF7ypL4sZeeJJTpdtZxREiyGuZSildp9EuvSsZPSUhMoewEWpz6bpJejN
	Qy9orps6DIPMDZYEPv/ZgylBotgcjM8lpMk68Kz8FcZXH5RRjuHEjLWJveaixBJNqhlBB4iMyNu
	t6OIIbQa7bfLJ2YOT9Cd+MMpV0vanijPbPyvCbF/MTEvwsjffrUrOwQtYvW4uCPjo1O01uZGVPS
	E+RSXNatCRxrM5lp+cPLCrPehLOCBmvArv2jlqoFvWXw/Gv11uH8HrQPzLwQchh3FDi9SQwMM54
	lbAmgyb/37fDx87GU33ggukGc
X-Received: by 2002:a05:620a:1724:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c70b92f7c0mr585127185a.90.1769588673441;
        Wed, 28 Jan 2026 00:24:33 -0800 (PST)
X-Received: by 2002:a05:620a:1724:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c70b92f7c0mr585125985a.90.1769588672889;
        Wed, 28 Jan 2026 00:24:32 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066beeaf9sm121311935e9.6.2026.01.28.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:24:32 -0800 (PST)
Date: Wed, 28 Jan 2026 10:24:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: Update compatible for videocc and
 camcc nodes on purwa
Message-ID: <pjgsxvzdqqlp2vi4thxljkprxwd53nxs7prpp7cj5n3f7ifsyb@e777n3nndnyo>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-7-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-7-b23de57df5ba@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2NyBTYWx0ZWRfX3hvebfR8D93W
 6iOBD/KsgNuAya/4omicS44ycq/TtlUocJZ9nIset6PJwOEJHEXAkm8cNYan9bl2aZTV2XGAsyJ
 F11b3x4pz9ae74FlyMFa6WAijw2bb9t240ztFGXXRa2SmBsgrSPz/sw9WkUYCn4F56mNiEmF7lk
 pLibUwAC0KKhSSiXADMOG0CecGNh1WVfXUPBU5Rav7efmpQhj/t/ibWjjq9p8qiYpX6dcfeC0DL
 lreJfnuj398G4mvUy/FUiDV2dOy0bhtCM1xgb3mn6Gk8eSmKjrmIaQ0vzODDc5R8Wgx4yuI+hgN
 F/ObuSxSfjHV9bGCatw2OhX+2WPpvGy63+LSZ8ILNIzXQkEDzwCrkMBYTIy9ArRb3RQoKpMFmM2
 yYV3rMGD0fOj3yjS/DYSgYfUYKEMqH9TX10txpSdcKHxipULOA6oC5+Ixx/G6tHw1Yf3sVJk+iF
 gyr5JTvd9sORdloiGfA==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=6979c7c2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-SFF1rR8kX9xiZyV__QA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 4d92UyVe-d9qzakSUICNG_iktuDOSrQo
X-Proofpoint-ORIG-GUID: 4d92UyVe-d9qzakSUICNG_iktuDOSrQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280067

On 26-01-28 00:56:38, Jagadeesh Kona wrote:
> Update the compatible for videocc and camcc nodes to match with their
> respective purwa(X1P42100) specific drivers.

Nit: if you respin, Purwa and then a space, please.
In subject line as well.

In any case:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
