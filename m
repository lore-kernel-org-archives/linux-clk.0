Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF43276058
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 23:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752536514; cv=none; b=HQOijyLSbh74ZohAE5/yxiKYMm0MNPhzdgqKKA4QFm464NP/UGpFZtOMNd9pfvdwdGVVuPKNoE8rlEE147tivx4jtL3+ILdWQ6VfjYPurCXjDT5zgE2bF6QwKpqR0Qt0Jur1EFajfWqQYTIX3fubKNaSrT6QVQSptN1WlI/jdz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752536514; c=relaxed/simple;
	bh=ey7rY+Bde2mCktXqa3uo8y+vyr6TGOt6Ny2N+VLQwmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g47FdioPJrcZCGTkaxUzLc8tgJ+RPzF0typ0+Ug2P7aSGW5xYyIaazInTFkN3PP2FOM/R2WyMf2EC0/9G6ndmFQXVXQsc91lvxoYCu50snt3B3wCRIQZ3Z0ZrFnbkeWKCirQOqMD34lURhj9XEefG9e8CQrL/PpaXtx97KZvMnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOogs6hZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOogs6hZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EIhLgD026577
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 23:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeRYeb70rL7zEXLABWVIX1u+Q+tiztEJvNfdb8INwvs=; b=cOogs6hZKzC35kE+
	Ei4d7dTfIKS+kLdyr+YXzjV1e202w3IiHFk7GE3C9VkxfXBMI0lxvB/6Qpx7IVzt
	lYV/5Zajz8+aDwtACN2aqgFjv79iTXy5Nxu/bquJKGEClJhaZOWYVqb2EB0npdin
	KdHoXwtCPj1aKqKs7J7ga6LYjBVCCHop2A5pYCglBzg+HqB8mZlKex0lenxeruFd
	/BWqWEJc87yXcuDNlXNKmUxFTMywZXgss+ULgcLGVvIufxHpbBeJ5kEHex9k8ltB
	++86XwX1XNNcDyBgc0ytgON0ZWCLsyQBeUMkpYCxjpDVFh2hjgqPnby6i9SGi8BO
	QWjg2A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbe5jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 23:41:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6facbe71504so18030316d6.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 16:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752536511; x=1753141311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeRYeb70rL7zEXLABWVIX1u+Q+tiztEJvNfdb8INwvs=;
        b=sem+EEK5s7teDklQ+FcFNeqSQDjqdJBTBiN4dQfIuxxvVGHxwGz2l1Hd/ycGvsWIQI
         ENK0xah45I3Gcl9oIqYhOu5X1zoYjR14cIeiLapctoPvuWo1BkHNsU6Vb3lnFckU9q0f
         11iYH1EJQLJDxuxMDFroRb5u2LVLvnfyhB33d2jqeNrSVmj9hw0GeZzh42BcLIVUOVYy
         xVttO/Rwaiow66BWtKVtOUKbQ03BY6ZB0gIQ83spjVbmymRusdOnvwJUYZtcd1N7FZdX
         Kv8BFjqGWxEtFFZZBwxwR8Rkp244yWKblcP6bDmoHk5hOjmLHh68qUHZkXGUhvUttka8
         DzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvsjuU8OLPrlcf8AdhAqFE0ZgxGlDLBI9QYXUCueVkKTgO5klE4cSDgjO2vxy1rV4uSF1Fasa7Wso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVZ7DttNEO1nSVJXslgGpKYJNkwaXP6MuFBlOoll6Du/t5nxE
	tAYBDejh1+OXzfXVci9+xKGokJZuiixGa7sw03zAKLUpYIeQ7wwXKzLYsFAxMkpzSQtdwTvu+ZC
	nL8gBsDMLVNtfa0sr/uLqrmjCpafzaJxjwunvSPEBdJm8DJ2UIpuCHajTqlKTqqQ=
X-Gm-Gg: ASbGnctiqBHlLSUz+HdOv3l5osys3OiSQfLRmmxvAccJr/qB2y1LKroYCj5w5dKC9sL
	cWjm29eUJg2493oWyZIWTdFGGPvb3wf2Ho9FroytjFBERJfMDQFDu1s+vJ/sKceQuR4z/hKjfPN
	jz01laGAAwEN8YQVTCWCOHLv9HiJMSwpecraEY3k06lvRBoa0FythHVrjZ3eN2PgVVQykIdxjTN
	S0pdnsAcEgxkl75dZcj8Dht4mW74IxIYaoRlujKjNOo2JLhtOqIKtyGOMgwpJh4ygtxaFO+3l1T
	Lftwg+6DpZAzvhngr/kUPzt6VAFFBVpw+zDpxlIxLGWH/gor5cnwPkaFUOXnF/avqAMAEEELajM
	s0FjjnoR+6B2716LloDkV
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7dde99530b9mr793406585a.2.1752536510684;
        Mon, 14 Jul 2025 16:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG7XfqmPDJb/D49KYu7FtbuASdqoalUiWXMFW7Y9kAKQLdst5o2Dt8cMYPxnLj3lAeTolOpQ==
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7dde99530b9mr793403785a.2.1752536510136;
        Mon, 14 Jul 2025 16:41:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91d10sm893953766b.5.2025.07.14.16.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 16:41:49 -0700 (PDT)
Message-ID: <3ae51350-61a8-422c-8e39-32ea6d8b2e9a@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 01:41:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
 <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
 <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2NyBTYWx0ZWRfX+DdcABdtfUow
 BuTl3Lah6pbtr7eIBmiXXSViZJIpdV1GTVyFKh42jnsKOR2iUf0uNUxAFtyJ1QHcNMsUUsizA6C
 FTxSpIRw48zqT7sr2xYNTgOMZNHunJk0dYWp5Ai91u/6P0aaxPb/KdHwqvb+X2KqECi1u5Zz7LM
 aAQKj+OATAAI7NiKTnThbMsmuVLyJv1zUK/1SkJF5JnTA1P64FP/l9JfK+u0cjSfXz9kuoGbjAB
 8e4bUcPFYG1QdJ+Xkl67cgvwFMckF3B/D0a7YkZW1vH5K/LY1s3aFjR+Zg4GmdXPAMyz7r6wSnd
 YUNg8LpSexZqF2MumyyfVlxDSXFeDYI55IPZGra6n6tY2OJQTaGgKHJoIlae8orD+g25pWeXR0N
 hpMmSYbVCoxE5Dfxfpo6i4SMdPDlo4DdKVxHB0IBPs33FwzOFJXoqVs+WvcWWivhC1DeIhq3
X-Proofpoint-GUID: EKeWcnfXFKR6hB1-xmMGYmXeuPDEYujc
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=687595bf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8
 a=ICpbbQuAY509VL3I2goA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: EKeWcnfXFKR6hB1-xmMGYmXeuPDEYujc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=817 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140167

On 7/14/25 10:39 PM, Brian Masney wrote:
> Hi Konrad,
> 
> On Thu, Jul 10, 2025 at 12:09 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 7/10/25 5:51 PM, Brian Masney wrote:
>>> The round_rate() clk ops is deprecated, so migrate this driver from
>>> round_rate() to determine_rate() using the Coccinelle semantic patch
>>> on the cover letter of this series.
>>>
>>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> come to think of it, there are a lot of drivers that can not
>> do any rate rounding - perhaps we could introduce a NOP implementation
>> in the clk core that we could reference, instead of copypasting
>> int foo(...) { "return 0" }?
> 
> I'll look at that for a second round of cleanup once all of the
> round_rates have been removed from the tree. From what I recall about
> the ~200 or so round_rate implementations in the kernel tree, there
> were maybe only 5 or so that cover this noop case. QC seemed to have
> the most from what I recall.
> 
> It wouldn't be hard to make a Coccinelle script to look for the noop
> determine_rate() implementations.

Thanks!

Konrad
