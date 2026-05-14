Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4730E38D6A2
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754118; cv=none; b=Hviv6hGIvh8ysoT26/Mxh3MISVAdmFqn/2OcWLV6BC2zWBbA4wAX5Qr538B/poHIRlk9m4OdaMzXkqsMus69PmkC7Pd+2y+0UR9nn62axkSwfFUc1qsMsjNJlXPdzufk4NndXatmP0DgBhD38f05Cdjppc+loJlwGyTna3soV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754118; c=relaxed/simple;
	bh=1tWjWC7ZSSRscsQRvfhjg48DksDTMwJ/hkJJZxDsIkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6+RHpt3kiV0HQ9a3ZWzm5LASoKyRGr/riLCbw0/2N+TmtrBByWFfwqKNgpOgNAwxVv6KRvDhzmLB1JS5YBSscJ3SBZ/Wo4zWbP1LbO4fFI4/KD4sUgQJ8v1k0nD+uQ3RyJDCUbtPQopMv9/8xXqlGjjvyGJIuYHjg16Oy/40p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3kn8es9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ek9mHEeR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3kn8es9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ek9mHEeR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kF8b1989650
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 10:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=; b=E3kn8es9MXVd1/Gj
	4rFSCZB/DNa08vAsRs8ugWvy/fk/LBgTjPynLqVzu/PEOOF9XfS5Aa0gE/ntqkSs
	5D/SMScTaPW8f1oMOmz03Z3yidtI0gEHjWQv3zM9tQsyP2iC1V6v0mJxrVNOAvY8
	dBx0HB55nwv8cq9xl5Tp57WiCwafKGVLV4XZIdXMPNpasMh4Yi+y4QNKMST03dEK
	PskXU+myOmA1UZndCWiLrnpqtWuIaa5TNqi45vMS+us9cfrReWfAmG0uf9Gqa5Pr
	HbCtifSoyZAEWtCYs3poBC2hlWo3IxklHdiyMbZTCkUUlxenog+3E7+R82zlJ3/X
	j6PORQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhca6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 10:21:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so9937688a91.0
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778754115; x=1779358915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=;
        b=Ek9mHEeR5Lj3E6bc3QmGrmePb4O7H3m9y3/AsigZLvCoRsd+V1bi26BIwis9KXSkNC
         +0kPd4PJA+7JyvVmTFGKHIdGhQuRvxTIMJqrP10XkGQyCj1XylMqquLjPeFNIpvddJVs
         Dz+IHX1E8UBeulmBBsCQDFIw/mfQKW/2ys6Y/DNlomjoTqMYH6f36L8iF9Nf8oOTLN4+
         tE6S3qiES1abgt9WNU8Vp8usGXz0m45ETxBQDAG2xHOn3C/mYk2SoCiLY5GfEce5MirJ
         fkYVmHFJ5TupUcHBS+LOlWPYr9woLHcD3C6zOl4dYUwONP/cuFMNfvz2u5bv/QV0LIKK
         wxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778754115; x=1779358915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=;
        b=IFXY7qWxxgLfFCmNyiYJrCVl2f3SD/DSbEI08vgZINLkl1KbDa3SIetfm7rLBo5++n
         z/B6+r7AciujJxB72FBqctARqEsJ+Eo7NInM3QnIxxqJzERn+fKZWwDrl2bU0IAnnsXC
         DeYKu4GCZuijoQ6bVGt+yiosJ2qS5vhR6gZb+W0IuEr8HqO3+aLor+MsZDcoEcwrtIUv
         15b3xPi1y9mXmG2AX6ViVdLGMJ3X0s4lFRAxeS3mCQGQLgpgO6gIrHKSc/sPQ0mTcMuy
         EWDRNkpOHwp6B0UGw9PM3flaPEeYbsENmZDcfnJawOypCgYJt6sJQSnDjVxupiHcnrxn
         Nhtw==
X-Forwarded-Encrypted: i=1; AFNElJ8voDI4TtQQf9jMUVKzcq+GfvqS+/h4fR9puYKRkm3vQIcmoj2n5FIKzZ18/7k5oEvvirzlkEAB288=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC65KEAWwinmbeqH8MENqCOcMlSjVI6uU3oi2TXLgEi7+cneWN
	eBK2D1xdiq7zP+LSgW2bDwqeFa4vA+tFwgp8rBCrkgap0ou3cTZXH+qUwPPGev2nW7ns2RatgOD
	Ab8HLAP2sTQx4z2wmc1IbUQPvCVZToBk8bE39MDS0e3SA7KqPkA8SYqGMxxxCFj4=
X-Gm-Gg: Acq92OGhTbY8juCbr1FYmpAcKpVlvWSs9xqdA9MToJYD9wpoE1h9WueKoEzdUQRNK8F
	7HfP2yVuDUNtf6xOdi5PTQK4PYpIv18SM2xBaOdcvSMhFKjhSMCBc+hfDYbr+LvI+AbbmpuH5tz
	ocOlME62DGfZANa4HY9NsMpqIji4gw6l1bi8irvpxoZyrHlgedYhkGL+sYz7gD+VTqZtUHKkH17
	Pb6JddSyCD6IJLoGZacnK9NckPlL4psLKvBcKO21ltd3psxUfyEhyC4953HHaNWnJSvAF0SoYu8
	GnMErXU7IdUewFPlscIE+Fs5svuFBRru3woxFaIBTP+CB2hXSF1gwdApm0LjSiXTAdiCtErr/nU
	3aw35GUcBxiATyIZAoFEUGrOMTYv9iQFE2w2zE+ETtxxlJVD2io0wZ4JEhWo=
X-Received: by 2002:a17:90b:4d07:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-368f782f7ecmr6252245a91.11.1778754115131;
        Thu, 14 May 2026 03:21:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4d07:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-368f782f7ecmr6252211a91.11.1778754114516;
        Thu, 14 May 2026 03:21:54 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee6280d0sm5974990a91.16.2026.05.14.03.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:21:54 -0700 (PDT)
Message-ID: <2ac7dcb3-6dbe-4967-bde2-10811597449e@oss.qualcomm.com>
Date: Thu, 14 May 2026 15:51:45 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
 <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
 <20260514-obedient-crouching-bulldog-7d63a8@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260514-obedient-crouching-bulldog-7d63a8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OKHVKQ2Xk6SofQfVbbRtqRw5pxhF6MwO
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05a244 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uKGqPZ-g_1yFZXzQAvAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMyBTYWx0ZWRfX6LGYZCQ/9eMn
 IMFSMywZCp5VE+I9w9bn7GkD0F1aqAioVGhW6PWCwZVybztLLUfpeeytkvpX+cFbdHqixcd4/3Z
 Pb49vYHkh5QHxcApS/ILAiiFECqAp6+6DsyfaTF6mJa35MTbrU1h2WkhVWWDueeB7TF916LnSKk
 +Eai0F3x4wwllWW+AMtN2rC8VgBGYKxdkhrZxCEjQYdnO2+te4KKj/l+frwPgb+74rKwkpLc/hN
 tgVVRjMXTZwQeLvcECvmN8Q1UInuTrCpLIt4l7Tk2H+luod76cQmnYCNZ5HrebKvmcH6gvST/ke
 Ma6ZWZxg6B0qhjezkSwzFfpBK4taTKlWMBVjTqDTd4iNV0FBKX+iqDiDa0wOpLGsg3WcTmUob1n
 H7d3HTA0f9ABvMi4k4nTpDmZK3zAglR8Z+29wjxdctBcOUeyJ6xrxVlcJOqvwsUG9IEZAX00U7i
 RCNhYn59Y/SncMGxg7w==
X-Proofpoint-GUID: OKHVKQ2Xk6SofQfVbbRtqRw5pxhF6MwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140103



On 5/14/2026 3:48 PM, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 08:57:36PM +0530, Taniya Das wrote:
>> Eliza Video clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza video clock controller to the existing
>> Milos videocc binding and add the dt-bindings header for Eliza.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
>>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>>  2 files changed, 44 insertions(+), 2 deletions(-)
> 
> Please allow others to actually review your patchsets. You sent v4
> immediately without waiting for v3 review.... which did happen. So now
> please address somewhere comments for v3.
> 


I have put a comment to ignore the v3 patch comment as I had missed
change in clock node, but for sure will address the v3 comments as well.

-- 
Thanks,
Taniya Das

