Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4574C36F413
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137872; cv=none; b=EcZ9cMAR/Gwmfoztu07Lhdm933kXHtbSlaAM895HAkc76kEEjn0TMxndPJKosnnw7vKNTjb87NbSqw6a1IY1bjnGsx2wGwjtVEAdK6I9DMM4ehZSIHqRr2fOhBEX346d+QRd6QjE0sTOLOmmK2vHaSBhTyYUlGsL/SQX0k//+Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137872; c=relaxed/simple;
	bh=mI5qIBVFMwGLLkKGKbAonBY/LKZ2Y4xMOrsGBPOVztE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfZ1/5bRpC9ythO6lCvmskxwsjk3srbi/Bfjc25rT6c7WwqWiBaTVHURcrKOPVkxEXmxtnctMS5uzz7H69fXkI4ANBaZcYjdqtc1vkBuZP+Nh2QqYQxcwqAIaRvF72ZwjLHEZlXAmEWAiYcoEOLnhIgtee9cVHu8YArpfBR4WoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lw4syb/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkCWzZu8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lw4syb/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkCWzZu8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5lHlr568739
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 10:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2JZBk2Rfa3rw8LMthiOXRzB5EWHK12Fq64DmUEVAXE=; b=lw4syb/8R3TUcI1S
	j1yESAfadG50WntxIQ+fF02pQd/eRZNIIIsU5eZqYk7PpExTXU9Qppc34MYOpeIv
	ymTkRrxg/Ngo00n0SjJMbvaDl4F0I62Idv3sIIpAvGjt7kh81NZDWSZxHEZQcCtC
	QtPFCe+RFNuSLRBpxWhUfppJxs8nPAy3cKKsHdAEdyUC1gdSHDbu2csu8eIvbzZq
	/xdVdlfp1wiavoVruyASlBP8jSjNeDsMxYEThk6ga8UhkaeuniOAPUfKTWWv5r9k
	deJ6+8jPaog2+xw7/7MqRbxtKsKg/PUBAnfFrip+YyI4isAyIs3hJVhFsO3Epp2R
	xQBtGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8gy7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 10:17:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd90958f24so74066485a.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137869; x=1773742669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2JZBk2Rfa3rw8LMthiOXRzB5EWHK12Fq64DmUEVAXE=;
        b=WkCWzZu8DVbzpchgmXwUGqMsLQ1WqMGINM/V5KC6LQAxTZCa+OxvwZfqYjwfQ0eNtJ
         gqv66Dx7tRt9J6CpI2CGrdFkLKzRSCOKS6ZyTa4BK/VRGsnvhKICChOu8oWfW6an0Nlu
         tCGejDsS40015hjMLeatMZL3DfQETuawojIpOx0NhYtVGzsd8anZAz/4acjuBrqY0ydH
         BMRPhrG4xfpO54JO0O5Nd1LOYaDXD7eNhYzERFih8oVPXqS6D2eDAqZ9uqOdwYwevZDQ
         b6WDBG46f4jr2FoyFd+z/blo5IBI/aj7Mi0I7i14z5lpzBlRZwbjppkb2bzA9AAM4Nsz
         DGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137869; x=1773742669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2JZBk2Rfa3rw8LMthiOXRzB5EWHK12Fq64DmUEVAXE=;
        b=gJzvE/MdBed3lC7UXEG8SnqwW9X1FcZS2gOdLgwUqICQUheQgz1LCrfMhwqstm858K
         RlepyBWO+Tu1ORqFnjkYa9U7hIz54ptejJN/AxlQO6Xso1NwytO8rOgB2DCTv55cN5K+
         9YsbfMv3XgdVAxtvs2sApNddNDEVeuZl2+1Jv/kxvm/oIwNZhAuSMFny6rQMUSBoxlFT
         DVDyj1djhC6z7cVBOVZMOLPpGVWDOPccKbJxtraJ9cqaMWRPCrzSRlE6etmEGRBNvy0s
         0QZV5GeqCVhIxRVpImFqU37h6l8AXBnEEs4wg5ED6vGqoTd0lBz+Tf2Iv+cIqhI7Kw07
         eeOA==
X-Gm-Message-State: AOJu0Yw1EqatQyw38D6uRIFmQsPYQQ3Pcz96AuY4Lh8qjFBYfVO8yJxs
	nxTOvoVN/H0O4MoHSc4+jmkr+dP4lk9q9oGjxjIkvDyMVy2lsmzCb5xN+wi1DvAa2LE0NhWO+81
	scalkbnhtM2UzM2s9jYlgZuNKy8NCUKZjnQ6T6QgKkp8GVwWKRHU1TCl3ke65jDPnnit8V04=
X-Gm-Gg: ATEYQzwwejXYe40KW8GLr6WzW2mNCgg1Iz67lDIj6WcibxdVVgwGdCjBACgIDC6mek8
	eqMoHMgoSNHNOdSlNq8fJ1jdYsRvwzIZcmSZVPDIlo9qUk6lWkbiPfe4bJseeGIlO7GBH0KFUVm
	GV+6dvnP1Lj3mG8gw+SD7XGtr4OLF80DJUDyNumkB/iOUnC+voDLjvM/u0urXaRRKNkOzDegqzG
	1o8/r2Cf1PwMr55TXJ0wdYXw+yUIcJ7sLiPol0RB/LH3JWt5JZyMFTu30wrvtQUn2dO1M9CYho4
	ExaKJ5zVDTrw9HjiN10+pPoTcHBH6OswcrEcJXI8ZWTf9wTfSIsCJEnRiuPQVSn/OP3vmIIHp8T
	+ytYn6awHtP+4gYotfcQdVahi33oRZZb+wfTNum/vi8NdcRu7VRB2luMyRYtUDIZfoutZXDrG36
	CxPRY=
X-Received: by 2002:a05:620a:2d97:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8cd78b6e9b1mr688659685a.2.1773137869471;
        Tue, 10 Mar 2026 03:17:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2d97:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8cd78b6e9b1mr688657785a.2.1773137869054;
        Tue, 10 Mar 2026 03:17:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6629311736asm1329813a12.24.2026.03.10.03.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:17:48 -0700 (PDT)
Message-ID: <92127112-9d7e-4fc3-ac04-4ec0206d8bd0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:17:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] clk: qcom: smd-rpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4OCBTYWx0ZWRfX1A3MQ8up85jT
 1xUuxMMFHrV4v23EvmEss1lHwEmZ3vkj61m3IsGMVru8/mKytxiEtfySFE7E5if4V+z06s9D90G
 X36RuBplyS0V8cTMix9CLswPRaM9i++u9IPQT6/1D9GdXn0m2VZ5/JLC3t7RC3/sxdcRNn8MFhC
 2V2LFIGEqqYY2JhPyAMTYyuDSAhArBvq0O7XC/IQmdHhoFDVC/YT5mjvOKBXPgFQNRi37zOwBtB
 ovSPDp+kCwOr75AmRQv32SoxeWTh5wa48lX+6hmi63mp5MmKxKghcoK0UKGNG6Zk9bz5JX2vMoo
 B1Vnlk4ptuK4qcy0om26AtE7Uw8X2EUcFsFA0wQJL1HMuekZgux/Z6kHuihXGuPwiKh1JQ5OXDR
 dEg9Z0UxZHfGLQsln/H+3lMv1k9k8cX9Rig9cc1WWqTb5ic8XCMerxSiYIcG5oX5jZ5xlW/IG5g
 ThmZlSGCvX7hmlY/0sg==
X-Proofpoint-ORIG-GUID: F8x9kGlvGWV42OygGtVwgNmkmmJ3XMdK
X-Proofpoint-GUID: F8x9kGlvGWV42OygGtVwgNmkmmJ3XMdK
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69afefce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=rLhnAkHiV9PJIhVTlEIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100088

On 3/9/26 3:38 PM, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_NOOP flag.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 103db984a40b950bd33fba668a292be46af6326e..8c6fc5adf5f50537a4f8d43872bf2f9065e5d6d4 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -35,6 +35,7 @@
>  					.name = "xo_board",		      \
>  			},						      \
>  			.num_parents = 1,				      \
> +			.flags = CLK_ROUNDING_NOOP,		      \
>  		},							      \
>  	};								      \
>  	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
> @@ -52,7 +53,7 @@
>  					.name = "xo_board",		      \
>  			},						      \
>  			.num_parents = 1,				      \
> -			.flags = (ao_flags),				      \
> +			.flags = (CLK_ROUNDING_NOOP | (ao_flags)),	      \
>  		},							      \

The other two definitions (using clk_smd_rpm_branch_ops) also need this

Konrad
