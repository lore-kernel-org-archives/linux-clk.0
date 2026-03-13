Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611F9384243
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773391335; cv=none; b=PRcqBr9VCTcifZN6e9IRW+C+VpM+C1RxSCZ9Ah2RI2QgoiIUeUNuImvTg3yi/35aTYxz5Sl3Mvphv3pcEtn+JaEytxbwnF6hNB1hfhov7mnG5rZmqYKaU6yHm357YXZhIrWo2mnNFsiTTizvQEb7Br7F6NEXYp9HdxMUa09oMxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773391335; c=relaxed/simple;
	bh=Ve6PiNcc143QryIJ7dyWVRwxS8jTgcoxh6k942QCyYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=du+DE/rH8Jg6Bz4pA2ZqVUipNa4oHXth48C1gV4zgvj7In3KdEl5fX1Mjyu+Ud4vqgoQuUPpIQtxi8TZPUl2snivmN7kfBNQQsXR/URroJXAiRZW2GOKvEyvPIt5j1sPr+igfRh6P6X3Akghk6heqhEeAkJw4Wnq4aGUO38673Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEHPwd3M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gq3iY43v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEHPwd3M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gq3iY43v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JS6I240513
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 08:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ysaCnoNXBJd5CGrL7Xb3oAj5KBlRFnMyUSTWqYDXj70=; b=IEHPwd3MKzoKEP51
	LIKfGxQqvR/eLpVKJfkiATsODhEvatKFmry8eSM0wMMWVLVMy3axoLqak9C5UYNP
	1cWkE3Jtf3zXOFL1mrC+ctTsnaJ3+wamp1vjoS7/cVglFftCNdSsmYQfWazYcUiM
	R02aWkRr/GYmP3/n4JMfzK66pa/AXH0JJvNTcsUfH7HmDUMVf47ERN9v8cy5Wp6O
	r/D5plU0nHHJ6TwgslupTGSlvejAWeQQA6JA34mG/odJeBnHUiAeuuzmDI+onYhL
	AF6uZ8ZSIcqUqirWjDzqepwXy40GWGU0fR2VhLriYgHIL+R8nJvGND1cx/RJYUmJ
	FlgiNg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d8a7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 08:42:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829942cf9deso1557956b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773391332; x=1773996132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysaCnoNXBJd5CGrL7Xb3oAj5KBlRFnMyUSTWqYDXj70=;
        b=Gq3iY43vtRSgg2Qf7C3a3VIKgopoD8OBtDsp5rfy4QyQbk3XzwyquYyClacPJv5FvP
         WI8KgB3+NIgocAB9vqkpLU4JtYQYlRVd+u3hqolQYs7IPWXcXWh6pPbzNtiTjaQgjq1E
         Lm3udcY6CVsHgn0IJqCi9p4v3jhRWBCdAn/QAqcdUFEfuB8iOGrzMFIxIGjQSYQBJLKJ
         wXvU4htkUe9oJ1VgQMHO+1HHb5Vx2MzY0TmVCl743uvcbFJehiY+rleA990w8AsoLAW7
         0/ckHwpVPZx5pZzLW+3ghejvn+EsjONWPdHNrzjpax8ViHgbBRntc5M59WGern5/Qjam
         bZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391332; x=1773996132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysaCnoNXBJd5CGrL7Xb3oAj5KBlRFnMyUSTWqYDXj70=;
        b=DI4PKNxwWGVt6283xo4C1ecQofW8v5msPBxZb7ShxlX2EOMJRLwnqdnwpXOGOtHp/4
         bkLFu55jX+vXBYaG8j/LCxPaiF6gqYh0gLMIjCEev5nIUn0MsThxgNtz1EUjP3kNdN0a
         emn9QHmG/rclVu06hDylnrOGtgJWyKfDrIFJE4t+FQIBZuX4sOSA19QO64qFDqZSzYuC
         Kia92jrfvFNxwNnDj+OGfaRK2w/h9HkIn4CaUkjeHUImyNZRsgIvh6Ay0tkr8yc4XhtU
         MdRO0EikSBYnlSY1j4yaVsK+0ez1gpeJv8D1nzj9qySUVd0ufQSzN9dPQmaovB1DS96b
         N/fA==
X-Forwarded-Encrypted: i=1; AJvYcCVQUcekXqB/Ou8hoR0Q7WsRJ5lZGo0zwro5ECbUazFQT/7/MTODdlNlCE44Ezk7NecuXXs+/WlVBBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ/Bu1+lXgH0Y4P2B+/ejh62Ui6pRG/FGlsTJQXvjNKzVXpP8Z
	ndi3c5HYFdu3EXaMLrgiLM0MOFsq7kEdolZYWY2XoRzpPi+RLikocjH4Yig579DBjVVJKbiNKVE
	hmqPEkfAFzBTvhkOYncuPWzMZUPl/rBXYKRyZDCH8wCjbKM6Dij0o37fQvUX3RgI=
X-Gm-Gg: ATEYQzwSxZBvrlw1fbOM27EAxnvGurmtTahXRxD1XumVkjh54PsFvYB//ItmCsI6niB
	g66nbh87rymZJCnfNt4PM8uiU7oWZBtSCSVh2hL0a8FmsVQ8DuijbdQQjDiQxU5+/BqeL9XVf+v
	ETdYYAUrcJ+VnpI8CAMQdUU9gsxV/Iwabsvh5P5ry7gG+bl31GBILSIP06TdVNC+MKLDnwPQ+H5
	zAZJEmYs2DIghhuRg8MUPAJkp84eEyYHEe2f5ZY94/aZDCFLUVWtuEJc8gSjXGggiBFhHDSJVUB
	k6rAxVs28bG876g1UURsQgA/0aFJm5wfeZEYjbfoowBBVQ0UZvBPzgo7mi4jSaBBW3LIvwjXf0/
	SE4H+zhpy8FJjvLqWhb3EB75xypxK38HSzNsvHFz7vb7KGcZ1eJ1gpwJR210cyNtYnbU=
X-Received: by 2002:a05:6a00:409b:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-82a1988e77emr2262737b3a.34.1773391331866;
        Fri, 13 Mar 2026 01:42:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:409b:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-82a1988e77emr2262700b3a.34.1773391331400;
        Fri, 13 Mar 2026 01:42:11 -0700 (PDT)
Received: from [10.152.203.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072414f8sm5428282b3a.4.2026.03.13.01.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:42:10 -0700 (PDT)
Message-ID: <d966a695-160c-4092-ad97-3761b1bf6b7c@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:12:03 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ5210 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-2-fe857d68d698@oss.qualcomm.com>
 <yzw4ruhxaznndpyzlrqnxlbrveenlpl4yp2ebbshyh2yo7te2n@64gldqqmk3nb>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <yzw4ruhxaznndpyzlrqnxlbrveenlpl4yp2ebbshyh2yo7te2n@64gldqqmk3nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8XoszvUHTK8JTzMErlQ3alMzYehjRAj_
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b3cde4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xo8W07fJ9kZJw7rHU1gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2NiBTYWx0ZWRfX1i9PO9u8NDCj
 udTRG8aUmXvw9I9EgnSLn7pThM8HlTM3vaEv4ScpmOK7F6dmJpRmmE3zNyDldAoKe26/t8CYouo
 AeoczDsY/PA5fm7HMw5koKdt6Sf2UXDyQaPchWyzzvjLb2oDGvZNwyFZnd/zi2Skbfr8nheqhzi
 ox8ws6jtw+nZ+rEMCN3usbrg5TR8fU1Ln5SNb8mSfEgT8x7s2ibCRc7akgRcE/GZ3Y+BJm/uk3N
 E7k58A/UzHOY6UfgcVsHM3d2p5mtGomtd0EtujBqAhBhbdIeRjryZBu/u3wWirhCU4sHvSy6bds
 qAd+PC6mku8a5icxiX6AvPVDZcjR+2jxYKZEmbT1Vi9Ax8jjxz5afmQhS/7Hby/bpGsoI6tqnew
 nPVXN6kh+8Od7Tn8SfsZLO18Jnb8JJ4NkX0fHaeMWx+u2DDqfitiHL5ab0y5Mx6iS9/xKVYezxa
 jlDMDzcg0KV5LO35E3g==
X-Proofpoint-GUID: 8XoszvUHTK8JTzMErlQ3alMzYehjRAj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130066


On 3/11/2026 8:20 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 03:15:44PM +0530, Kathiravan Thirumoorthy wrote:
>> Add support for the global clock controller found on IPQ5210 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/Kconfig       |    8 +
>>   drivers/clk/qcom/Makefile      |    1 +
>>   drivers/clk/qcom/gcc-ipq5210.c | 2641 ++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 2650 insertions(+)
>>
>> +
>> +static struct clk_alpha_pll gpll4_main = {
>> +	.offset = 0x22000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
>> +	.clkr = {
>> +		.enable_reg = 0xb000,
>> +		.enable_mask = BIT(2),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll4_main",
>> +			.parent_data = &gcc_parent_data_xo,
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_ops,
>> +			.flags = CLK_IS_CRITICAL,
> comment, why?

Sure, let me add something like below in the next spin. Will that be okay?

/*
  * There are no consumers for this source in kernel yet,
  * (will be added soon), so the clock framework
  * disables this source. But some of the clocks
  * initialized by boot loaders uses this source. So we
  * need to keep this clock ON. Add the
  * CLK_IS_CRITICAL flag so the clock will not be
  * disabled. Once the consumer in kernel is added, we
  * can get rid of this flag.
  */


Thanks,

Kathiravan T.

>
>> +		},
>> +	},
>> +};
