Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3723D9DD5
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836569; cv=none; b=XDTI/aLKfrW64mN0E4OrI+olNAcUcnDgNbN3ssntMUg6HgaqGBvWuEnYQNNKq0rIXCPYCN39gQ6fuWBy0DYU3S/3wwXOCB9bon6VacJRp8kqyWcvnz+fc30IJz9JEhoTO1i4yVzTOP/1cmlkQgdYPm5Pvhqp5ac+gjoqT0Em1VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836569; c=relaxed/simple;
	bh=+GZuJTb0iMsl4BoZhYe3y3JxlxvYISX/fuuX427Ffto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snYT7Vtj4uADbdINQ9vwZI63h3mSf/PW9IlCYsRZmOpPjtH8tCTwRJqiE7dGppkycYRlpzAIBgHlWlB8be72z92q8S6qd625ZHrZfgpdE8LmXr6gOaGCzWvL4Y4fv0Ul9qJjLSXvY3CCfVweimALnvxTBm6Ep9kpZc/pxagJvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAHpwEbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHk3dpxB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAHpwEbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHk3dpxB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1Src1322653
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=azMtyWroEh5ozJjlVPeZSbb0
	zZ2Obb2WMFwBowLkgIU=; b=eAHpwEbpQXllmYFeNxYgwrvlVib8+sOyBj8iy3f+
	7pRmL6JsWnt9cnbbctfsDjuisA6tiILNFeyA+GHtHpcYuB7eF4a+lvtF8ur12CwE
	FWPvBi1DM0g602gaLmitscodJbI0sMxr7h89GhW7q/mK0lqlSe1VK+XJOh71eusH
	WEMlX0grjWHvkgTsJcl+JMxjdqpgGKJlHn/3E0tZkErdayfAM2z1ckKZ5huXXlzs
	QmQdobo9nxwkTcLPyiDtDHTdqkrE2lFqQrVjTLm/je/7Tw5gjgwogOJDcgFvBJc/
	NmJ9tbW3MJm772/0a/DJid78nlvbaL8DycsLiM4RId7TuQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh8w4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:56:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1279caef718so13329472c88.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 08:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836566; x=1776441366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=azMtyWroEh5ozJjlVPeZSbb0zZ2Obb2WMFwBowLkgIU=;
        b=jHk3dpxB5v/nspcURpqbdI/O0HtLgZ3VCoMfWaNVd6lahYFeb6e+/DzchaTnGa56e1
         ANvdSUSqQCfypievH0M3GTo4tcGJ8KUpGWenbxjK6oG/vntqF255OfCzbIG2jhldl4UQ
         VEhWb0QuexvSyMZJG5ugdmZXS4LlaZ9GtQ3grOSRGzQNo6ggwsZlD0ED4S5kXvh0S4QU
         Ocdu0Iq4+l5YbjLT6aXrYlGKV0dKCefkYdCTsqQaxTeUr/rvdWmd4ylIaXa1nkgyLOOH
         1b4HkQgOzhvzgYPgnicte9UfiK2/vGa21m30KDkqAXfR92zPuSvAvJ6JPza3b9nwZOv2
         0A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836566; x=1776441366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azMtyWroEh5ozJjlVPeZSbb0zZ2Obb2WMFwBowLkgIU=;
        b=VgRIEiuBsrhrIut4wTNvaRcJ3O44aQj1ijuf8J68EppdBmHkAx9k/p60o+r2uGmh1x
         /0VLr+n7n46JyKmKG+JpGWmYS8pi+/Hf0Y3AB2sEg+FGGLthh7vH/F+Aq1mYd4wFqDDO
         fdkIHhtXy+Q0ehGzT7MkcocnK5pEGv0nscldNJ66rOx8Cu2fXHm4p9yt0TuELZ7a3rk0
         UEALSRW66VAH9I+QZ1+xKl7C1VOytmz7cbeCp8hg2nu7agMqWiK79xK1mualCezSVfwk
         L0b+Z0ZuqHl0xiXRQg4oMnfQyNGl7svPK4tEhik9f6E2QTlg+qwhhnIBnhWP3AKkQsvI
         za4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcA1prm7tKz++EWZBYzDlCNf92qUrLj3tuwwGFsc+Isc78sHN9l5oIQZgnn88V8PQgGAIFWyOjsOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGDyIM0pOk97YyK0F0XpkQjsGlhP+ORWtCJEZyVbuA4M9MBUnc
	W4kc5KNxKlBuFMGnFFE/zq/xhdTd/sad7XqxCM40Ra7ZOPlpRfhS52amJXRD877uvBiKNaCWCr2
	fmV7ByHPoUZlBb6Iod6fjaSbMrBWBKcpSHvdOoMv2bZgvvtz7iI4qNxgZYGtc390=
X-Gm-Gg: AeBDiesDvGCxbArcqgrEftplPywS+QJWEQGSxRFRVKRr4qtS83R1BcarWxi5U8GquCe
	/J/enYRaDfblv6AU9QAkPWEPKNNVoMmv4mpDG43n4dkeuY783wApkN4Wi3qwZ/SaQHqA52hWCJU
	BeOtTSMRuwGkDw0wKdM7NiLYhGKKt1BV1vOdLwkG51Eu0FjykFODj4xqYrAKIiN0KMH/MZSBOyL
	Rk8an7SPdpljbWbjIJBIoR8cGBNpRdO+j1hJMfZeXkP3yeGm+kLhtuKu+jGrqzy2nQw/GmabiDf
	GtFEvSQTqNPY055zkHg98y9Ht9b5u1gIas1fUQboSiBO3eYD+5oNpGZyWfg6iO1ilklfJX++e1n
	PS1RadLNUty75cRw/3Yt0IVdzOU5MY2WhvncfoylHA39HOo1qsSR5r75C3HskxrcLPzn6KvoDHh
	A=
X-Received: by 2002:a05:7022:ec1:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12c34ea2415mr1935231c88.14.1775836565555;
        Fri, 10 Apr 2026 08:56:05 -0700 (PDT)
X-Received: by 2002:a05:7022:ec1:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12c34ea2415mr1935173c88.14.1775836563921;
        Fri, 10 Apr 2026 08:56:03 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm4621453eec.21.2026.04.10.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:56:03 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:56:01 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: qcom: Add Hawi global clock
 controller
Message-ID: <adkdkYovFBQytk+n@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-3-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-3-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfXxok17yg6bKU7
 aZkp0DgNTMWmZIzNZW5zKdQ/RawHmAOnHEFZebkfEXo+iC3+kNeb7BBRKGcddQj9zhUHsf1BXZm
 s6JM2m119sLoL+ElagDAULpNDTH/jrCpkJXHgQvieViXuTmKIYkMOvUjRB2WTlkHLtnmGJcDLbT
 1tg/0Gwd9aOOTMMx12NC4Eq9ub9ed9sh7sh6IHprLR239+SQIjf8QmHwTg2LECi0zkcVCGPAzRI
 JoPWmLRMogZPQp5ugq3UAtUC2dMUMb8mQB9SexcVdeTXSjXN8C0BzRKgu28v+R5wDObjVKtJXPc
 2zWX0GL96fv9zeXCo6I5hbVAkZTsPb3QOE2UU+CR3oqJ/+03JSoR1Kp7DB5hbNmnaUkslkxfAZo
 tFo07lpkW8KsB7811wYi6F7BvPdL5hxGJpm0DVlWhVe0+xnizqnxVinqnyPWm0FuxsckxyweS0H
 s29WPbhjmSi7BNTCeKw==
X-Proofpoint-GUID: MxssTAQ8AqCG86BiQQnJa3QpIGy7fy7R
X-Proofpoint-ORIG-GUID: MxssTAQ8AqCG86BiQQnJa3QpIGy7fy7R
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d91d97 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VF2_CLY_OfEEnuuc5wAA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:37PM -0700, Vivek Aknurwar wrote:
> Add device tree bindings for the global clock controller on the
> Qualcomm Hawi SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  63 +++++
>  include/dt-bindings/clock/qcom,hawi-gcc.h          | 253 +++++++++++++++++++++
>  2 files changed, 316 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
