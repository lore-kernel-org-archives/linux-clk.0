Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0EC44A40C
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387178; cv=none; b=ZROqvVumzA7IGoL8KU75ycn7RD/CP5Hnb2cIry0pzw2YHXU/wqh+2w5yZh1amwPTHdUpeJI/Lb5KFnoHeEVa2Hrf5OWa38nlo0As/CarbFR05FqhQd2ERIQvgPxj2iw/38ihFgYNGIFa+M7EWqH59i+Xu5M4tJiGZxpaF3hBw8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387178; c=relaxed/simple;
	bh=voYq/7WpilR3FczPUR6KD8QW5pL6j6cFboxPZXecj18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2QkSF5o+6Gm7Do5qzOtAApOobrAaF/vM3RBg5yXPCn+7tXWwPrSpFagjuTvda6DHb7UvD8GEs4S5aPP2r7pZ4cjhgBT8RUMcjLH1it0lKm/+/aqqphqjGuIrTP8LBiGbm0AYepWXHRFvCulz2VtX7r8SMW2roAqftFdGcqDg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H00Q2wNQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxbWdBxs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H00Q2wNQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxbWdBxs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwM71460502
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1Zd4uPLrJ+Xu+XVywJmW7smaAlDGHp+icf8MnTk3zk=; b=H00Q2wNQ8auLtK3Q
	J0sUm8LnC/4dd9SxlWq3yPZdDsVhJlAQQ15Mtct/5d1hfKXtEb/V+LD2uiDhVDW8
	cryLlt+d+WxbD8FvlN7ovH8GPRQ6tuZq0PinGkM2P/l+q0kAqNYvvq5nCOcLj4UU
	C0N/5jPGSNnSjyDX8cVfwdj3qvN2kXzDDcXp/jUREi4c7FTanHE7PuX/80qNX4vc
	2UU0UK2mItOgArLOQmz/VNpkUcaUZMp3oGMZukbA8tfWWC0NQxGCHksY+wymTwZ0
	3rZHRnG1v4DGzW7puBsQBiyQ1FL5XuEHFPwT7pCmbKjQFDX8nEGk6swys+3c00H5
	z6uqNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8j05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:59:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so88469285a.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789387166; x=1789991966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1Zd4uPLrJ+Xu+XVywJmW7smaAlDGHp+icf8MnTk3zk=;
        b=kxbWdBxsK66EcWQVYXph+JwAsLjpyEOl54Ddhbo8WYdY36S0L/HADBAMT8aYR9GQ6T
         1DzhJ798KtZaq32HPcLJqV2HaydO8UiBUvRt31f0Na9RysAOdKw6UGEpTE8diiL+Nn6Y
         I7h7ZYp+3AhY/Tn1pdOZDgJMtiWVHF/5x3pNXClGVmNTBcQzQmhXk7C3Qzd5hQ1Q8OZH
         tX59f75NpKGXBryg7RSSZAlACik6xLFOGcl/hpDJ72KPGNMqaIzbLFKUNc+v6bKKVXXb
         9l8s/TJVo0EXc0BItvxKzLZgKbGuu6yabPYvj8uaQq8xtrgzh9H/P4l9wcOq/ARJBIkh
         a/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387166; x=1789991966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1Zd4uPLrJ+Xu+XVywJmW7smaAlDGHp+icf8MnTk3zk=;
        b=qEKylGZ/tRZ4WtXiW/lrJIT0Kg+AcmCz3NQqeWuIm6ihaobXLQYFYKOv2Oupe+RPrr
         OJYOCNQBmTZyujAwP57DMWFzngdxMqswN99WlLkyBg96ai3ThhZx11PU47hsuKmtnDjs
         4nUao4m+SOBqgQuULGexzNBAt/pRGIr7HSd90Xqe6js/NQCh6bKP27YjR9dZhq6vQNC4
         cWeksYhpMXnCgEG6Tz8jcPjgfMtPBmSQenul6o/qbPbG5Jop+NB2FHeDwrKoeoAAJ3Kn
         rhO6B+UVBZnJCBkyB/T1I8ZHGv8d1dihMCSSHU+MjTxolhcAaBgfMVR9vmP+tXihb03X
         Q3+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzyioenLpNcz5euIlnBJLNPFCu8XAhP48JKPcdJy3rs41fKXIz5LNdI7los48OMUzE3c0DjowEv7/c=@vger.kernel.org
X-Gm-Message-State: AFuF++lfsiYITEAePuOD4GIyFEj5nDnpwsmwNzb+TmDmdoRR1VadOERz
	miC8BrMs2+Lave6cm4hsK8nQ98mBo64OwBqD6aOkstRPIVC/k5NRQj+CB3SmwS3ELWJANv15QlL
	EuaepsmO5I1Rdc+CIknEgK7ltnJ/RehuoSdotGBXMe0QNXzujCP4553QlOqdRf4s=
X-Gm-Gg: AYBFou2zFZ4ypcUK+lwhgAGOmtwcO6f7porwjGx5XlPIpkQ2ja/LnaHlRhOigqXpZUw
	KHY2YZoMylmdqKlffkRlEWrlyrCWYvmWr0J2e8lhXA0aKwdegj/B3o5+iKpMUCLUj/vmCpr0H3t
	XM+s2LOcOh28vFRYOwYfUAzA38ajXpb4mDYb5pM7bYHCyVWKV0lRwEnD0nPm2xJj9FrlXMtTiv5
	SUOuuiTEt+c2J8LgRCF8Qh67YJYtBvOKl7R9q7RfkeqU+zk7DZHL+fEneUyUvv73Rfkqhdtywu1
	YSv18V7vzig0xDj6Yw4CZRmOSiq+ojdhHkniyGAxI6AtzLpL6HVs1qm1zZ6z23p70nMLfJZCb/B
	E18cu4zIcktoPVzGf67yp5g==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr239016885a.4.1789387165911;
        Mon, 14 Sep 2026 04:59:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr239013385a.4.1789387165442;
        Mon, 14 Sep 2026 04:59:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8beesm3960445a12.8.2026.09.14.04.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:59:24 -0700 (PDT)
Message-ID: <ac9ed925-21a6-4611-b1f6-bd018dea3c0b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:59:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: qcom: ipq8074: set BRANCH_HALT_VOTED flag for
 usb master clocks
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>,
        Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX4cXwddD3Hm5w
 u7urA2xUnaHClA1qB1gZSQ219VBF/sQrkxuuoUKzvSDtYtcAlbp4Ffo6vPH8IoolD6ZSTScPHr4
 03ZzVe9F1l4X089J5MWwWF3p730DTGInc/1dZjTVQocdzk7Bv7TCTLIG9Lnbx0fQW7uB2LADKaY
 QIqQUZeaFS/rogR0khuQpEd7dfr8mNVNV1vQnUKsBKd1yVS/GXUQk9Idq+J/KGa95yTWQlRdysb
 35SaG1NyVizno4gl+f5q1DqfORY6BJum2tHi+Z/FqhLEEMG7UfwHUSwhKeo7v6O6JJ/jcyUMCWC
 kN34F0pT54XQ+KS8/qnEoNXI0WYw0Qmc71oL/GjyY8a5bHMGgIylCSggd8QC2agFuE3eOwAYcFg
 RW7uTF5PvMwErE4QEXEUW9ztuaBWgPGKPOQ6NHukmYWDTNmibUj38yP+q6vyEW/0fKALiqPW8Cp
 tPf0l7gBV1t/XOBu6YQ==
X-Proofpoint-GUID: PVBvsashZcM98rKnvVr_br0cLRVrNSRH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfXz9CIivGTXEpS
 gJymflQUo6pmpKIVDEyoI6ceVK27q10Ua/UYALw0sQgNy2jE/MukDar6KHG2gKxyCCYZPEgcDpo
 FWwxrUCfmdwBnKbCkVPofOT6sDw4ts8=
X-Proofpoint-ORIG-GUID: PVBvsashZcM98rKnvVr_br0cLRVrNSRH
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7e19e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=rrY2T4ysBfleW38DPu0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140171

On 9/10/26 12:00 PM, Chukun Pan wrote:
> Currently, on some boards with older versions of U-Boot, attempting
> to disable usb master clocks results in a "stuck at on" warning:
> 
> [    3.005088] gcc_usb1_master_clk status stuck at 'on'
> [    3.187119] gcc_usb0_master_clk status stuck at 'on'

This starts off nicely, zooming in on the reproduction steps, but it's
missing the key point - the "why?". What causes that to happen, and why
the older u-boot specifically is the problem

Konrad
