Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094378;
	b=lolw/SA4EUqEGMtY1uiYydJGJ4yB4dCNoa4TseFzjtBgtiH+HgoR6j6+c+mv9gYCV8NN
	 d49C98I10spv6NdK/gynAGMT2onttorETbUHqfWbF1Dhery5hP8Vo++xLQeewA3FpwdYj
	 ROFenjD/5XpaBza0tYNy99MXKM4DgevowMfx+0NVABWTgmodw6606cCfFDRqjuTJruC4n
	 9gwOXuTHKQGf6YjMZ8Ik3TsBaX10XE7cHftkJ1kt0TmU8ffTNi6E1ADRjmWsRzsqpqt3T
	 kE12NvaO6BM28nq7nnUqxWuH65yvx8QYApLmElJq4uHAVmQltWqk+TV4tADUY+v5OhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
	b=gQHNbuSI3w4ltHdYHDJmwGyGdsNfHQkZ7ATaRFCdiW+6RXCt2JiCDeM69nrjkWJZLAA3
	 bXrN9i3vP9saAzAPiuzFITlXwyPouym/BMDRdBQvGAFCgI3D6io3Ob32dwlcHrYkRoVRR
	 8SFdqmqzJByzNA6SHlMXagdTmAhFLaRwG/oeWaboPUMBGk/bK5UlME+KWUYfgflGei3/e
	 q9b4sMQU7JaGuPXf+0eUGy3g424JLJh6twM4oAhc29i2Z+OQjin27Esg5h7Lvv7pZkmns
	 wvENnDFl1mEfwIj6lR3LfOBtA0HbQI/geyIUlQn10SnkF8Ruh204fKpAaPJRYNCRduA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FUfhFgJa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYML2dHr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F0606A323
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 09:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998F0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FUfhFgJa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYML2dHr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fwkN2259207
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=; b=FUfhFgJaeOwflecF
	mPAjGpqS0USAJTcMefy5ALM9V499+JdRLqUgkit7wkQZWff+DXndWkf2rzm+JtKH
	gQSNqxtbKK/FkT3VWddvEqNFxEy8cMs0QqMbDqmEISzUh6FuodDooTSNBKwtp2pr
	3iZMR9Xg1KbAx27Vt6jAqLgs9gPYPjTH/zOLlClohrOrCL+Qn/ncRMcD7nYbEhYS
	e0EHwniNIzN2DR5aHoxMYqV2sXebXfxVDa2TtAr/khvozT6w6uWN3a6FJELfad9K
	ftpoEVgeYCgsqX21AFJ2+negwqmySiSD5nm7i5oCVjo3UnNtXMzqNczwH/2uPwWl
	faz6TA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20ev2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 09:46:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so3792015a91.2
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094375; x=1793699175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
        b=WYML2dHrepHQ5Fx6xlBvqLv57ixM8Q7LGw1jas6p8PSBAOE7mYYZVWvUVL/mjo5Zk/
         9j0/LfNpZLNprLZksTw7rnQdeemjCZUiQ7cZfW7e+dq/xU4L52claOctQ8Jyi6Gac3mF
         0pRFL4wPNRYGauLQBV/2/v06jfBMdrwYeLYN/PMD98JMJWqXHqAurBBfpvagu8Sg7WPr
         uFxZnGFbn2A4VqYy/GhyLG31/10xsuytxapb4Vmq3xqmn0ZcoB67CClcihnUA9HZOUo+
         c8xaucX+JL/Tlmvd6rslGA8+H14so61wGb6MTEEssEyh3QgD6iMeW8eHJCGLh3KenSEu
         NQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094375; x=1793699175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
        b=hs3gvUoA3bUzwZdH+UqEYu4hsfHfa/93P0DCCzD1SdCoe4vn0Thomusmex1XIuqTU1
         0Lb+oPnuXYWd/Cn2HFP5gMl+N+hg3TV5VxzBzPV4JujeU3c9b0sr7tLALup1Wids0FQo
         CLJ6zof4O/CexLDBDxM7FYOdg2H/S6uLQcSL2EiPbG4wRPjKVSDPzdZbZQ2/hYBReoZ5
         B0h4Fx/lIpwG/3fIEeQVWOivyqIqKDc9GbdFBuga7WDJo43X5cakpr0H6w31uE6S/k3K
         Exx2rN872RRPv5nOeiCcK5g2QKKedY5O7pScwAej0v04mxYYlvy8xz5dFHrn6qvPG2ZH
         A49A==
X-Forwarded-Encrypted: i=1; AKwUvBxe+UOWDVpY/Jdw4tV6jjrS7feZZENcj78epNTzODYYA7LstK0mL9KBGaB44gc+5SkVIm41vJ+I4zA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTnVdsnRIDnTYVQETDObnKxI5nEIPLuexTTedEobEX96cyOXnU
	leUlbW+ujyIOXUefdRBDIresPmW5y4LqI13cmQOLPIpVWNve+H2CT6vaUtyVyrbG/V0NODu7thT
	0G7kATPZ7nSCv7yOzKoigfmzUUyNb1som6/NPCMsqHKTkhbLL8haRge+FiinyRAI=
X-Gm-Gg: AYBFou0x5fM1d51fm2P1EPkPRpZFpUhRwz6ej0sCOk1ANFUo6+sWAQ/TKPyMMg0VhXt
	ECst891yGO0VKZyderE0ueboHFRuDwWSTQxpAzzjkH7dt7RNPtG8djdll6G7XBaG7Goqg2s5udf
	KCcYn7Ci++xUecPspV2LshuR9rIa85DhE1AI3lZTkct18cgMqley94tCxIN15CC2bNCWvIRqPmX
	Tna2Cjs9t8iB/JxRtrzt+9F4tQSZH+TC2pewNFYUrfY3YPJqn2QAlJMyzocmC0BZNMNmyKBkleu
	7wElR5Oj7ELkXRD7MxPt5MK1v4mAj/X8TtK9SIDRkvQPKx3FUoRSrEbE2rcNNOEHIs73O1BloGQ
	++DycMD2IyhgxGlO03RSmH8px/0KS0PbCmfmjUU7Qn6iN+CqVDux+oDZDePeBNO2LjdI26OO/L4
	I=
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr7498319a91.44.1793094375488;
        Tue, 27 Oct 2026 02:46:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr7498293a91.44.1793094375038;
        Tue, 27 Oct 2026 02:46:15 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm6585735a91.4.2026.10.27.02.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:46:14 -0700 (PDT)
Message-ID: <79f0f94c-e474-4343-bcd7-a50ac858097f@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:16:07 +0530
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
 <9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX9Iox8zJiWzkM
 9bGDuaxdQt/rrfQQK8usmIQmL6HOoMkNBy41E4KjEkQuvMf9TaqwoSHE0oZXS+Zac2RsTk3AU2v
 Nb5WNcPR9FYZ2fi0GJpdlf71tR0MdKINspSkZfbM1++MKRc46qsSnaEtjNJwjB76flBmpPXJhyA
 3ZA/M++HAwIfLz5bvH5n2sv/+M3wk2kGPgt4O/ZAIti8HstZEQm7SWHTr73ZGEq93tiQEePv8mO
 c+wO3OI1owCRbbVh0BNdtR+kyFk4dpjGjC+f7BSx/qv9hPx18DhYm2ZPE+f2tpNd3zROqXIEXF3
 Y8KrkIh9N9HxsEqQ3HRQyrBxHKJ1iYT9dtvsz00bjyUX3Gtw+UmoJzBhfmAzO4GUQ0ftyKhw7Vk
 NePSdjIIwpgaLn9UwijYrb8PI3MPfRYQXLaqOX0n8g0SD7Pu/9dsGPMEmmepXM3T8LYsxYjKlBY
 jUORUL8CD1o86jLZVzQ==
X-Proofpoint-GUID: NLVXeH7s2TPQi4ooXL5zlX_EkzPv_MtM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX/bDj2A5oyZgA
 AqfIvgIa5RrW3twvyA40NbsNDNoucO2sheiP8JLySCjeYYa+P+8RuS1CkMWUQmcUtmqGqNFyoQN
 rriN5WcgFLGWYY+PuDmIcERlLbW0sTk=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae072e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UHJlGdhkk8AUXz-q67kA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: NLVXeH7s2TPQi4ooXL5zlX_EkzPv_MtM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270038



On 10/1/2026 8:47 PM, Konrad Dybcio wrote:
> Suggested fix:
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
>  	quotient = rate;
>  	remainder = do_div(quotient, prate);
>  
> -	*l = rate + (u32)(remainder * 2 >= prate);
> +	*l = quotient + (u32)(remainder * 2 >= prate);


Thanks Konrad, will push this fix.

-- 
Thanks,
Taniya Das

