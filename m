Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57882F49F6
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404279; cv=none; b=jTyExjPYfb1QdsDGFhaCVBAmidbQvooWX+8PuIbJAdrV6oB4E0na70VNpqkNjGB2twOoIpDv999s1T2rW9sYgRUmeC4cop0Izdwzjp2JOodrv/Wb/xTNG11qWdtcyBkNdtJmFJW8eeC0vYtPimybuGprXVz8kSmVCIsNailuCjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404279; c=relaxed/simple;
	bh=ZWt45yH42sDKPvaNptuhnbtCXjsl75kDpLBkxKkK3/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vh6WQ55EFo2ir6YdJ0dAs/s5bJzFmpD39Tn+55zAwugVgJUV9/bVmhnz1q/YIw29YX0EUi3xU1lU7FgLOr+aQWyf9ikcNULkVQUit8x3P6qn07Zy+v7b129WpnvRsPO79jcdC9H/yrjFjEy22Dr2JSJFvt1oILSmTA/pWIIqOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpFn/idK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TH9TuM+/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpFn/idK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH9TuM+/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HLnWV4420224
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 08:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4AGbJPnQwFvIJpxdlL3I9UAJ
	Z5tojgKAthjJExwJ3o0=; b=gpFn/idKggaBGEOlGCSvJgBX/yb9vG+qv3U02/Wk
	gP1kOYxh0dMP1S70/DN8MwJHVtdR/YOi5TsJoAZzvL7NVugMn9xAzv+aiwTyQLBq
	tfbf65/TpvqwM5lMU5omQUrSWI7UpKTKBFd9Jdvk8mP0ts+06vY3e1GclywsVrYt
	3GWOUa8Bp61yfbUSttmCqmEXYF8iiu9l8CnzsBhHtCu5APJGdc61mNLjRqTD09co
	52Z9ZeVtKX7dU/R7v7ILLBFxmWvDhNlhwAjnHkqAJ66ZGRi0OOE83j/ry3isF6pi
	nrysXgSz7YHopUjNO6scKb/HpZvqBXOS6YiWWyyPpcx5Rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd0k5hbn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 08:44:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506549eb4b7so451114911cf.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 00:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771404277; x=1772009077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4AGbJPnQwFvIJpxdlL3I9UAJZ5tojgKAthjJExwJ3o0=;
        b=TH9TuM+/eTOksLLdb3d+uFBZNi+NDgsuXJTSy2HToBhwygwYR31egp3VXQ7pVs1/4y
         rQgUtmjx3CdNEup71JB3Tshzwd/AxmWrT9UCa3LmiXVhyLCswJbxma8J0KTj5zEZwY1k
         BWSvgMX01PlWXwQ8AyA7q2omju1ue4f4t7XCrruzv4gBxIJfVScaxPXd7mA67UOR83fP
         lf7sdldtk0Qzfe1b0iJFagV8dRjqnTvgNblUFbMzZ95K6i3Nnw+MS8kJ2d/0LMUf7SN/
         xhkK7yvH4v7iGyDYNkUYbKENF+4EN/Tu+AGhaJo+Lk1oTCoGNdvtD6qNjjCQYMWViL9e
         GgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404277; x=1772009077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AGbJPnQwFvIJpxdlL3I9UAJZ5tojgKAthjJExwJ3o0=;
        b=CrqfqdvN07tgIXlh6hcO6dxssPApNyfE0bWnJQCfqPTOChNs8Y5SbZ1R0R4hRQjDY5
         KZy2KyFw1/8D9lxUrHB6fVgRrC8/D124iu1bJbSWfIC1X/t2GeX2dgJyZLTs+G83M5oN
         t4N5In2m4lKVVu2MaHRpQPz/oqxmok+tZSqakY7jHb55WszDMC6jUO3C4Ox3JMAy0xZG
         I+IWJRe48h83+hHxNlo3Ynj5MHUm/cBVJGJ3bFfAyMgPw3hF8qlRizeVsfSDiJs174EQ
         FXwBCKmLWFf/gl+WnN3i+BvL2rYS9LKlw34GiL/Sd9Bt2Xc/0kM0SSVqvNnMGuy4/1t7
         HUmg==
X-Forwarded-Encrypted: i=1; AJvYcCVAXIU9MRlfnETqR8+KSF1lyqxwejPbC04YsnOY2sug7jCneJ/0OL7KJW+3CnOVBVaJqNBHwQ2GQ1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk/QlI7hCZS/K7sb1nEcz7fcL6gZ8V8fsgLCqYzin8IfXz0hRD
	uGh4LYa1j1HnE+1YvHpnt3KbVFsMh5ra4UjD8sIWVZyLcx4HKZDs2NzTjE1loOUcCfdNgANYVyd
	IJOmKlARdstizXHeSlNm0Oo8WlY+Fl8o8mE9ZXNQGB8GCNOLJWG3sz/0pjqmgD3M=
X-Gm-Gg: AZuq6aIe3+Z5zIARruhkQ/vg6oGI7r+Y+zPo+88GEHCsTViXW2ImbefH0ihovr5yTnY
	WMlCL/a3JzY/2r9BnlFMBNhI4VUZVuDksOFhnf/C5GBlhZ+CGFjdt2U5KAcS9jlaPEk0c9BDHPI
	3e6EcN2/SXSN+SfjpQwEhFPJP2Z3yxtS7f6/MVxzLZTEYOVJHiJF+1hzCnF0cTTnoyt3+g4jTCy
	sOcf9yKS5yaZY0p0h9Waid/p7AWffn8ZEkZc8TiuG/qy3ImAtyCg+bUMlmtqgupRO7HMzRfkiL6
	MaB9m5yebelOkZxMJHf7fHYFj7xzlXnkqa0gOIhciU0F+XgIjNUdx2IXVKFdr2YwEy/J00ARMvN
	BGGBUZDnBkC3Pt1yvc3XrHOWa7Muz35xFV0LY79HYW6iR5f13oZmf7ltmAkH93pywywv1y3AVV6
	XJDWMvIIdMI70lpAKk9O+ks9ge0TZMlnhluoE=
X-Received: by 2002:a05:620a:3f85:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb547758f2mr1364563685a.3.1771404277151;
        Wed, 18 Feb 2026 00:44:37 -0800 (PST)
X-Received: by 2002:a05:620a:3f85:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb547758f2mr1364561685a.3.1771404276625;
        Wed, 18 Feb 2026 00:44:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b051asm4338028e87.72.2026.02.18.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:44:35 -0800 (PST)
Date: Wed, 18 Feb 2026 10:44:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Message-ID: <7gdpb64yu4ydcgfejfavq4g6vc3rz7cn3h7shle7gx6upscpki@podywah6acxh>
References: <20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com>
 <20260218-msm8960-sps-rpm-bindings-v1-1-bbc11c0d4f24@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-msm8960-sps-rpm-bindings-v1-1-bbc11c0d4f24@smankusors.com>
X-Authority-Analysis: v=2.4 cv=JqX8bc4C c=1 sm=1 tr=0 ts=69957bf5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=wxLWbCv9AAAA:8
 a=HlxF9o-pF0jV7hyblJIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: NIafURxnELtNVE57BkngQ5Y_uMQ1T5pL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3NiBTYWx0ZWRfX8siMjwPUcOsh
 bz7PGCw4rIV7qF2FuzEBjJH+e1hwOjOEi/Sk6je5fC7GsWReGRvyM0DUnnMUT9FgOQyqv1YX3jz
 Cqez1rz7OfbKB6voVt+cz2tjryMaY+RP+6GtFmN5XCfJY9zZyIT2PeX0wCqfOP6KGGvMg+biDK8
 CjHn2Dj2nbJ2/TRlVSB+UaP0DikppgEJVmENpcVL7eBLii9zjPuGoZmeZ+GpqhC4hFKXcWzfIy3
 g6U8b4DH8z0x7YjzBwMO3FR6jYw95Sr7DO2LVBsGpGw6j/y94vMIs586Hyxf0NVejUxXfeTxDN7
 J9pGu0CfGzXKlN8S32RA3spXqSx7FtHscAaNpCkMnRju6G05hJe0XJext/TsDwrnxEYmi/3WRQY
 ZYFC4buknTaylSUSwRt/JSltjTv4DGoAMQkkKfgGVOwQetyv5M5bvQmWvB1l1UjBpAn03U9O6sG
 9y+STKRIYrbIK8OHy1g==
X-Proofpoint-ORIG-GUID: NIafURxnELtNVE57BkngQ5Y_uMQ1T5pL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180076

On Wed, Feb 18, 2026 at 06:59:05AM +0000, Antony Kurniawan Soemardi wrote:
> Document the qcom,rpmcc-msm8960 compatible.
> 
> The MSM8960 platform shares the same RPM clock definitions as
> APQ8064, so extend the existing conditional schema to treat
> qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.

The way you implemented it, it requires driver changes which were not
included in this PR.

> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..f84d08199e47f45ecb176d350eeb7df8c3ff506b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> @@ -36,6 +36,7 @@ properties:
>            - qcom,rpmcc-msm8937
>            - qcom,rpmcc-msm8940
>            - qcom,rpmcc-msm8953
> +          - qcom,rpmcc-msm8960
>            - qcom,rpmcc-msm8974
>            - qcom,rpmcc-msm8976
>            - qcom,rpmcc-msm8992
> @@ -90,7 +91,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: qcom,rpmcc-apq8064
> +            enum:
> +              - qcom,rpmcc-apq8064
> +              - qcom,rpmcc-msm8960
>      then:
>        properties:
>          clocks:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
