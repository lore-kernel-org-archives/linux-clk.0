Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86D33CE48F
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836532; cv=none; b=GydqHBgtv7BESSuwXuXYZM9xzbPrWH5Do831MrVj/Q67V1luA3qhBBQrb37i/F0zrwlfjmqFd8CTLpUdySr877ND66XyIW92+6jz8wBpnzaqUyp4VRWZWr6zB8NVltkeQyRpFUu8RrzTQXLOvlUSIo5TMIFxzy5cywquvbLVPCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836532; c=relaxed/simple;
	bh=CxybIaQH7MFOHyBvFKSmsTpkPwl8WGXSWFMtatyLJos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbtRe3s91fi2tlP36zEZdAbsaucrPg1yeX0sr0mD2riMIKZfRKeV7HprQITOVpQyvk8hMQ2w9YKstA73JGcPTqzafGrZoWX633ykadjU0TjuOqVc6ARyP1pzkK1q1ILqs9PBXt3NB1lfpdnJO4kRBcApQtw476Y/AJ2Jm68r2Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p76lyKcK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7XKEGmH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p76lyKcK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7XKEGmH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAFfm9709079
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PmZzFPxdGek+nVk0XuXvnYbQ
	TpPE/KFBaQPEfM9RE7w=; b=p76lyKcKs1kTi6Qfc5kHlM4nx2zxVjd0Zk/AQyvd
	Mtd2pChBrntA/j05nQ0bA33QSISozVBV5m20cuXxJBNELZ68VOpDFRLQu+o6nLCi
	EjIqAvpd34HTe3h6BaJcsWSCG0B4kJTk/LAt1scb6y157/vcb1MMtNh21sHEHrQB
	3ULN6KIhpimIsQG8finKjMDYCRG0k/eoryCGJKlThojMjFZsHRqgBNrD5MVNf+Ue
	KSZsPcmYVDzZKocRHOuYyrx+m3MauXA5+F4+lSb5X8Z2Itr2M2PrR6RuVd2/DIjc
	XtNps5RCPSBYm2UFWHxuNXjlWvX6csGK48yXVxeftA5D6A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj21ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:55:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c33bacfb7so160778c88.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836530; x=1776441330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PmZzFPxdGek+nVk0XuXvnYbQTpPE/KFBaQPEfM9RE7w=;
        b=S7XKEGmH5TTF/MOX56F7oDhYOUSh3d+kqeCbyOrFq+mEP98QV9SXuOTbKj+VupxN+k
         Fy169tpKXk9Lsn544Q8TTRr6/dBAnAjIWpZ9/mlMehGBdfd7rAIIV8OSDrH420VKA2QJ
         Pqit/P7vzT6QgdXBYfPkuBllDChVbGtO8yJZMXHPrpuKRdF72FXJoCeF1+UAKua49Ce6
         Eiz94GbbJImHGscWwWw7PCw0+nSvmJgwH8Ky3hJANX+9BtcvLTeEwFoRdr/URwtgW0C6
         E3ZA5Y20vVI+AYzimCD/2xKGLk7r9ifyR5y3FzQ1/P18yi0/XQWIKCwVfmk+/FNZoUr2
         +ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836530; x=1776441330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmZzFPxdGek+nVk0XuXvnYbQTpPE/KFBaQPEfM9RE7w=;
        b=qCLPuI9SmQjTlB+ckHR2liNatSMKjWgTl2je/YcxUKZSY5puo5z/2Yd3uIGZV/dSuz
         ACxgzM1UhhyJm2dg3BOV2mytG7mY50gpm1X4L8Gn0AvtHwZNZBZhQSbMSn1beMEdRbCN
         3Njh70JGXbnKddU/b7Skog4HzzCcW6vb7FSb+pbbDfF/NqiZUCAtL3+IxI60Bxxv/TBY
         jFv4Ab1MwSntsIq5CONeoU/6w1J6RIA5o+NvbpiELM9UlYtpswubg0XMpkNcdOpZ3C5P
         ywPpIVmNoqtoidejedvhI5MVrO3Hpsmj5iUeNzRqdUhPAcYtmg8tqUiZ+5EIbGVo+CET
         xeFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV76hL7zuVdCo+DwdL8VuXoBHWREoHbz7SM0y24wirdWgKpmlmQ2Vh51BVn6g/1uFa4ZRzTRvi4Y2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgGBFbgoSclPZx8SPeuf6XVDIgvFWVYgG1JJjbTEa57uhgyi+b
	FgMDzhZiqWj1xnpWEyhnLe2kv8LF7GMFNaJmDhEbKqtA186t4/mZuou652cKSOtNNq3wYEBTOPq
	16Og+edY9PuOjSINPzZvYtm0FQ6/atkpBSUNYZbwWplB0D8Lb9jAi4Y3BYwCtUiU=
X-Gm-Gg: AeBDieswPyI7rhgk3jcRdIE3/dRHM5jGkQZEf55/5o90MvS4vyD+ibsHKnjCje2ZHjk
	yle1u71vg56z69ZiirGACNQf/vNx65VWPc96EgXk18cKGuOlDwZVEhLOyw7gkmwGzffmSvAcNQ/
	DRdsIrJ7zKW15J4fv/Ti4DDH6C2hH999pMFJTTbqyXJd4Irc5jK5ID939l3qFpnC20h7h9ZJKt7
	hQmWaM4zXI7ScfiO85Otpe9cwDFSpaOcClHWvpHPISdyQYaKEAD6MWv6RyJheQ5ckvG4gxir4T7
	QlOpyDFPBPqhxu+GJzrVCSq7qB8y22/r+rg/anZOPaFohgjqaZKldcSEYcjp4EC6z2SjEebmHLk
	S7kxnFrnO+etsqijokBTLBqzCjL8IJ4tdIC/Z7JP76v6EAOi4DSYBMYw6DNw7aG/maGpfSZb6nP
	U=
X-Received: by 2002:a05:7022:4a2:b0:127:9ece:c47a with SMTP id a92af1059eb24-12c34f160e8mr1898534c88.36.1775836530281;
        Fri, 10 Apr 2026 08:55:30 -0700 (PDT)
X-Received: by 2002:a05:7022:4a2:b0:127:9ece:c47a with SMTP id a92af1059eb24-12c34f160e8mr1898513c88.36.1775836529688;
        Fri, 10 Apr 2026 08:55:29 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb228sm4328082c88.9.2026.04.10.08.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:55:29 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:55:27 -0700
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
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Message-ID: <adkdb5NFp8gec0A1@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-2-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-2-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZSuvYE5HvTZlxa4u1-C8Utzk9xgQpqwx
X-Proofpoint-GUID: ZSuvYE5HvTZlxa4u1-C8Utzk9xgQpqwx
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d91d73 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L_GWj2w26O6mB9MJDZMA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX8JTPUqYzNlhn
 RatNCLqr2O4ubxcMrvoWSqk75VL6IB4FkkCOz2gwhygFQ4MQrNgUQw2q7pDQWjudY+805SH8SKz
 MUHWYJRGsGc6zsLtpBGVtvI0ZCEyZGvio7fW05wBXBiNZkvreAjZa9HVofeo2UbzYYqpuUMp+DT
 YTEkNqejbPB05wqKKrS66udmN/rQzq0S52LqnOTHmupGpxWzYSlW4i3Oi8UCkWQ1yEmk9HVaNzr
 /vpPKQHLPQjCQKweCofoTPycYwuE9F0a2RRM1hmDq0FqWpPxF9SHSQphZM4Q1U9dTnVbescaF+B
 tabhOFugArHQK3967MmbjOME9DkqtnBIK56VNpQSxctrPWyZnFzdtLjSfEfGOT0+hbe3DZBkVwh
 yljdwVxdWqtKjYT3eaqSFDpRT10drH1eHl31M0lUfqwsy+lAbBlZnSeDY+2X3BFxxxtRFEnBXog
 AArCAK3O7PV1CqCnU6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:36PM -0700, Vivek Aknurwar wrote:
> Add bindings documentation for TCSR clock controller on the
> Qualcomm Hawi SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
>  include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
