Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D138B7CB
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143582; cv=none; b=uI7uaKmxonGyo2sww+7BV3cGn16+RcpLnVO4+iT4PsTV+wHqN6AKnU9r8d5vi30Y0yZDUKYMiCv9b5vEZNRpU07kBD9E1OSysQk8d/zottWjut9MQ4g/stdL4gCZzYEb9S+dI3qsIpkaRIC3eKTRSZAV+sZ4Dv+vTV5dXLn2RB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143582; c=relaxed/simple;
	bh=wuJfZ1J0cTMXd34ZZRaeXdJ/YtQQW+z7Rm2XWCQelHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4VgcR79yH3GGT0pV5Fv+WP3ro39phNCKglq+TD8RBtjeanPivvCF7KzPewx4CzfGEmNfEuTqPWGT9GEP9y/Xw6dNj0WlNRscg45VZZYySnUfJ8MW/Ofkj5U75cd1Ho8LDmh4mh1UFuTJH0Oyd5OIVP/xEwFd3qj2rlK7Ep5Ctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRFdlVSn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUgDtMGh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRFdlVSn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUgDtMGh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9GMfm2362835
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lWkfIqzV7N9yy+L+rQ8EQMvjhYy3SLPjyFTlUWehnOg=; b=ZRFdlVSncvrSsVJr
	WPO9jG2df6972q6LCOhxLVXp5jTSZ9MJpDAaWQUCBvTX+PdnNx3qEhk4iDU88GoI
	GWfDPe0rJKEnE9Fzxom7uTUbaPiZPq+9rnkgaoWAcl44kna3XLhYMlI6zSxm0Avt
	MMLKmYDSp4nWxgkrUcm3uJdAaJ3awk5f4Dh8Nq1EEOjmTLWp9Yh0Qlsm/yftB113
	gSUtDGCOh7j0eNCe2Z1zky5fZDEYPx+hfZTj06ZCem5EUdSKlF38Z+cutSU+QeDd
	3fIufFFgUsn6KE5FkchFPPVqfTlsGwtuhJ6p1BqoJtb3wMRa3On8C6MY5WJpSi4h
	Duon1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032c2h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:53:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8198fe16so176966285a.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773143580; x=1773748380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWkfIqzV7N9yy+L+rQ8EQMvjhYy3SLPjyFTlUWehnOg=;
        b=VUgDtMGhx0yTRPXNyRIbsMcn+mTIRFf3ihyCoQ87lAV0WrUOE3Z8DMrVoxtyZt2gle
         /ubeW3fqYOlckalK28lcl2WgviTIRk/ZcUFb1YFCgN4LaNlwfGy24Q4R2otU9BI6CAF/
         h/F+kB2He5xO2E9F2RBD/G13ovj2ABT4vGu83a0OxBcRMzOHaVQRwHiigBY0E6Dq5bgW
         DtEE4AgzYmtRNgxuubhJVyKQpScw17psn/PS2Pt3jxkmP3I61xs2/V+7M/D/hg23RZdM
         NPYdVcANtl2mjeSEdeRQoDVFOjAuV7vBAp/VVzwIUP9Ym/twixqNiu25+J7Ah4/B6DCp
         Tyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143580; x=1773748380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWkfIqzV7N9yy+L+rQ8EQMvjhYy3SLPjyFTlUWehnOg=;
        b=VzwAMXR14/pCTKR9MLFrhjYy6c25G+wjALrMNap8nNpy4PYFNlsK985B8R2ic2AbN9
         G58yHm42nQ/tzhyUXteEKw2JBWXHBSUUUh0FuIwvjXJIVYgTzisD2a+DFDUzScSU25NJ
         /fRwgkZP69LRfuNtZhAMdGkANbR5SB7Wbn3K48AB0fhxAoEYGRbZrfFRiiqhVigwiA1f
         hbPK0DR0s0qnyiMjQQGCLfcIMJKvSLW6rev5tX7lTfDZDVHvfiYEPUev0NgdGEPd340y
         IfZzfvyr6Yc8LCIk7cXFSyljAofUS2kM6VEbOPkfbbuGsGoXqsNHU6NTwdYY4zkR6VoW
         xf2A==
X-Forwarded-Encrypted: i=1; AJvYcCX7uDNvavv3KzPuA+5j5U3VlzD/qH6QJh3KF951Ock1e3YGW38dJp9UWJgr4BYe+mGi5I6Vf43WIkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmtgAsTVMtmsyDdP3KBntleATYQfi8p16PytLse/MuDbICivps
	qhRVNicCIYInAfihKvBzXdoaLewp/77atmS8FV1wMkCLWjE3/tSOIR4Nvsq6xXDarP4gNqEhw5o
	3wtR/IvTfz3/xx6EE97IM+kUxxJhpiTkrHRjacyml3/gMoFLPh6GwtCNSjhs0WhU=
X-Gm-Gg: ATEYQzz7WDSMlo5cVtZGSU8jeGtQx715oCxXxuXcmJdp4YH+3TsU/vlFPoGms8iKGLy
	+gxQ7dIWymB854VAFhT1JezA9t0HOJ5NCghcUQ5zPggvfeQbFVccvPks1aIQZKM023tP6Cjey/I
	cfNG0inhAwstfpG7lLQmXmzMY5g8YRmoid9RWiDmrZg8tpDvy+GmZM0suDI0NbtTlA6UMMMHIiY
	X9Qm/03h5Y2/PH0oTNQCs/jzJWCrYxStFKrj1jQGqoG3AvxeH3fI03ue4X2VQIski2mRbx76tvs
	F4thB06HBhbYygo7cjf/pKtHbdXi+Wl6IeLgOqYOaxGvqCWu56Pd8H4Ik+bzRZh6Q/+48h/Z5lr
	qL3ZPsepZsBm1zG0y0keGxjEB5y4JNq9/UN2kP0ow9lYY2Te7sRxEZg5Xk9oAKa/HhBqW5RH2cy
	HfvAE=
X-Received: by 2002:a05:620a:4151:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cd86fa37b1mr722191285a.1.1773143579574;
        Tue, 10 Mar 2026 04:52:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4151:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cd86fa37b1mr722189085a.1.1773143579151;
        Tue, 10 Mar 2026 04:52:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d6dsm4189837a12.6.2026.03.10.04.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:52:58 -0700 (PDT)
Message-ID: <966f9187-50c1-40ae-a964-db1b19eac7d6@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:55 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: gcc-sc8180x: Add missing GDSC flags
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010214.224621-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwMyBTYWx0ZWRfXyV2I2+Oixfzw
 +wVjPg4JK25zz+rbldfFs0BdE9Wa2OH4TWJNBode72IJ6/rcQ1f3eVdb1B6W7+yq0nlhuebYfuJ
 dR+bKYN17sTqArn+MACtfBkGqt9I9nmFYiXKy+aKTdLbWQCWRUddKnRU4NNy7reZokuNsAptwbM
 o0ykqPm9S4ieRNi5BrPe8iMVTCEzIovr3hX+xTqJQfXrBJ5jQMz5T0MmW54Jspn7TS2Idx4T9fE
 FFugnLOcsXg2iDkdti1qyAT/Fc2lpcC5XpyfT4WVUV/XaTnmysRkRR1x1JVMDZNnaEh/50n/nYu
 XlDkx7cURyfIxZR+ade2zy7Ha7sITOPWZu984u16P/PvzmvrqmWblqpEUQAcIqjNrFNsoFsweck
 AXt6ZIZE4TfzVxBtWouLVBaVJyvCv0X0DpylkyDYXRrF51DuMzN8pWujifB5VZAnS3pfPq1pYcl
 PPfoIM+830sDmUFwGbQ==
X-Proofpoint-ORIG-GUID: MBnds0wfOp5bzD5oSLIl09VJV-O9KLcg
X-Proofpoint-GUID: MBnds0wfOp5bzD5oSLIl09VJV-O9KLcg
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69b0061c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=YcTtKlT3hu8PWQJ1XPkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100103

On 3/9/26 2:00 AM, Val Packett wrote:
> Similarly to sc8280xp, the GCC GDSCs can and should use the retain
> registers so as not to lose their state when entering lower power modes.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Platforms before 8250 don't seem to set this, let's not do this
unless you have good indication we have to

Konrad
