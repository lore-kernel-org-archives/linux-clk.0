Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75A137F300
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572829; cv=none; b=q+0bjKFNJ7LUxKfHqCfx6qNgdtMAnxsnqSmGLCS2KHOu67JXchuuGYJqn4s/3bngjRPbwDL/Yj116TQHGl5FQ9iVUHwLXbF/Nq+krTx5qyX1oRyQlioiPkqToQEgK1VpEKuvdjgGF5QJR1kw4fkjIlzjVdUdTDoEY2Et/V76tHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572829; c=relaxed/simple;
	bh=4DYl81kZlsuBgH9Cq6P3j2EEwAY76sVSxzqBLH4OTgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjK8nzJqiqR+nu/lcWg0zTlnMS6AlxF+tkoNHZIjXtiDee/2AHu/yZaogwrSQOhOW9GRNU943KNuKyUMJRjTKjkfPkHSjC9hyFHeK0JBIy7euJo5EpcGxgxiq0R0Op2xutbyePLIpHLtu0GZW2aaWJdMkrkqeeXgr3T/gbjwbKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrLeFETa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6xc6MHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrLeFETa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6xc6MHd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZRmD1620128
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 19:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rAx7zopvulLjm7Hc/dyluOi0
	kS3PVntTNHMshaG6O6s=; b=WrLeFETag5DPDLFdA6mGDsVLV0bkODfX9ZjQHCV7
	i5pQG2LdKOpRNtDIPKZw2YhA7jf6MA7vNU+R1zR6RRxa9QB63UfjEc46bevULuZ0
	wZdyg4FIigoEe49OqM1PvmQhBM+5MhgaQf0FldvscMNF7GWHLSKEsqmfbGNm7BhI
	l2I2gqVa3DpwuR0OrId4kBE6oZJ641x6L/lPm7ZmHTBYeSScZ7MFUv091w6f4K2J
	wXLO58J0kcPUxpvzmRM++Bdr10Uj1Xl2zPGJc/8NdeRk4DI8+HdK3lcrhHNEHGjt
	O6lKO5B/0rzZFjGlW1GV1RNNIz4gdnA1LEimt/KICpRUQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t70bm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 19:07:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso3182785a.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572827; x=1792177627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAx7zopvulLjm7Hc/dyluOi0kS3PVntTNHMshaG6O6s=;
        b=P6xc6MHd203qinrFvLBW4VO9qNbH9qGjRhUHNTnVo/XNgJGPY1x8ZD4PhJtpY9cFLJ
         BtxIYJcPArJLrYTE4ZvYO7lKfMLzoGt8BdGpt3vuqfv4dO4diWaMDwKejmuPkcnGl6zJ
         MEDc3tcRH/iJPrl5lBBbqGBzbsPTnqdawr0cjUG0ZENf2VkJ7S+VK8K2DqI+LaJwNUKj
         6ouT7nsrl2zAcG/zGK665v+gD85udWz7l7Zx0+Jc4TsvZuHoR+frSRkctQ3XHn4nHv7h
         eRofR9ANleE5yez46w+eOxDqwngIthKb0Br1w9nLTALdTrNsU/WHLvayVtLf5LzQlkB3
         ZXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572827; x=1792177627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAx7zopvulLjm7Hc/dyluOi0kS3PVntTNHMshaG6O6s=;
        b=0Bz+2ge16C4oSZSF/O9Jb8n/9381z+cvr6qZ+UeKp8l04NJrgRSlTreM2GD5SDf4y7
         37OgIC+q/nhn3kV1dlhf64JpXOxHjVrqUR9vcGJLRBh1QOAecjC2pfOnmn28dAWQ+B70
         fW5dyQ+AFsca2dGiT1exkU22v/rJoKYFQicFd6EC8IVOB1UtlC7oPwcJm0DDyrT12UZ6
         6bfRiz4qkV/8vrCn8rnPuEswpKrbyvbQAXrXp+UNWF3LDhKPJAaR3xehg+neTPEwfxlN
         mv/Xagr7gKB7g0Fdhntj4Aku583tnOK15aB4K7zG02FnITm8EmYwrYRCAK0ZJA5NOjO9
         hVjg==
X-Forwarded-Encrypted: i=1; AKwUvBw3Z5A/yRqqD0GEhkp/7rME5h9gpJZWXqq0CZQt4fqohENvcuXx6I5h8ri4NSPR9zPWlSL0tOK+sUs=@vger.kernel.org
X-Gm-Message-State: AFuF++mIHSw801Y2a6TAVDS3hHMuEjYLFqWPQO4WnSJKzMnvXciBQxFu
	wzWokhj084CBWYX2PEkE9RENUHqNw8H458MxExuc+OyNEK2JoE3rTWmAJRMAHnTEtLB3vQFtjsI
	ZGe1PvNp4eBpBPNl69wP3XfdhQTrwvcgiQhddLlhxtIQsu88hnwTShzDZ48KP01g=
X-Gm-Gg: AYBFou3y+e/73kMdAwvSXC1tPp1OHGunmFSfAstheSFnYHW6lX5MR64GwHySFmlm6Ly
	UeYfNItBDk3E4P4M9Es2iyciGbU85/4wzV0EOrzh+6zCFFUo9dNISN9BdKXGEckeAI9TGg3rOt5
	Y022xnw0YymBdUge8VYobZeQH+C2dKo3ZltdFDW44t2ZuPPiZBGVSqWi6Xg4se9MDiZs+SlgatA
	vHK97akzy28KGn1xpropsP4O5Q3L6YpDABizRrzBtPanCf8sdqgdKRMtT1A2A8bG7Y4VONOyNc4
	CPgPv5l+GK7DxsrwFnNFa7TP5IaICEDoQa8dSVM3awFQ2PLNhuAr4u+Qyvn5J8I3e+JQCgbx7Q3
	o/AwBK11Jkh6JsZM=
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr523228585a.13.1791572826761;
        Fri, 09 Oct 2026 12:07:06 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr523220585a.13.1791572826018;
        Fri, 09 Oct 2026 12:07:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac94c6sm5327825f8f.42.2026.10.09.12.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:07:05 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:07:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Message-ID: <vorbu5wtvnwxxd77lde7i53r72wu6wlta457ovvzso44rlgnnk@qa7egbe7mli3>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX1PFJ8KsF4jS1
 fOXLkqv/9osnI8MFo6EMT4ZmqrPGCQOPQnYPwzn7PUvht9PyMImOQcnu1O3GJQWirSgw+iw08XV
 L9j3Fj6Zft37oU7fZedUuMWcL5qwTUlmrr1OSKXN8z0eXdJvy5RIrAjLPC/XIHQnXJyaxM11KcU
 OC82O91tWlvlSxCyJfml5lKmKTl0xL6PpxwnhRg3v5bFGQ2jbfwgb/MUAuFmImstQfvSlP4KX1U
 juj6c5OlnGSjINkIXEJG3ObzuGl/MVZlg4UUw2aRWweN8LFzxsRvUu8oG/SNciQKzfK67jj2cYT
 Ogog85ZT+57+9V7KB1s7yByMvNhwpezgVYWbUT4yU2TExAkwfkvES8e/wKCcJTI681coK/Qn5F+
 kX852F4PXUaldjlZAGSCvb47PToYRs7Bq0Ex4oc7IHTwS5sf9BlJqjF1oReQzVpFEN3b9gP6GLr
 txeJb2YBWyIwzOpVCZg==
X-Authority-Analysis: v=2.4 cv=Zt94uN7G c=1 sm=1 tr=0 ts=6ac93b5b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX3/r9SWqKkxwX
 TPISVzVFx9UPXWwcs7XpXoScbyHTdukL6FqfZwADQkXsBJVo7Wti6Z9el6m4CiWR3fCTTBgmISg
 IgpMXnTy660fEz5ob2yIxR/aGrOhiAA=
X-Proofpoint-GUID: Cl3CjbdSuhHwPxjUd3mIBK2puwPxJ85-
X-Proofpoint-ORIG-GUID: Cl3CjbdSuhHwPxjUd3mIBK2puwPxJ85-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-08 16:10:35, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
> of this node.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
