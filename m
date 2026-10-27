Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082567;
	b=GrTAgt9NUpR0TTPUr/C/ebsQieLtX1AGAyOxY/E/BwoqohwxMCJevoDSl68wWqYrdtKc
	 a8Xi22cKKz+91x8GZF0elrXgsh7la0sRfA/EBrZeEmyfaDebCmAWSJEfNgGq8yk91VfiJ
	 ibgJDUTJ/kx8L1+59f23aUeFmnAs/khalfGGTIoRnP7HxHxMhFMsqui8oYIfxYrpDHhDl
	 G4e507QtIfjWdVTBPc2qQ1tYILIhjJnG59S+s5ke7LpUfnDsPCSnmBsBqqk0K7zra55ie
	 rNzV9zjnzFAx7evJXVVWSJRo+197YTj4BzoUSpMtsZqKEWkymvlDryNnFJbcOkKq1cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=;
	b=OxYJq6DioFl6y4z7iB5Uo+7sDD4ihb7e5tgJat2XFsf9reEnH+kpdWeRtGvCujnRXkxd
	 SnfsstGeHh8HcuwRTYHV8pBSxo+8QUDHhKvEDso9LqYbatkhlR9JYFj3yjfmwpjFW0LZq
	 noY4v6lXn9Kbb/GT4Pmi0VqNxhh1hwb4N4nIvh4g7iDM4Rng3JJ8Z76/mfdtIwhwS1BjJ
	 ltJG5yjBzroHsH7vgFIv6K7WdkIkLYIJIwKqUi5kKy/jkkBm2nXxuzlNxPGKKVQIBidFT
	 e8xkS5nPKh3bS5eVViAfv5HEwmxLmtGwIK0A2KOxTbair2Wm3XIGDB2/LqW4tw+qa5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bKbobUZK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nnld3526;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C7E606A31E
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 06:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bKbobUZK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nnld3526
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Ys0C2349795
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 06:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=; b=bKbobUZKdgeegorE
	Ynl1GjUhN9ePA5k8f3olTI/fhso3lM8IrDZIsXt9GWQqv/muihJOiB53p/glZMZ7
	Q52QQdKM7HwrqaLNeW6qUBV1Re024YbU/EqT4UXU3/KuEucujLAqppwB/2eqd/9p
	G7oLoAKqgUyp7OJJmloruE1GiL/9NPAzhvMmuXfdtgfeYCBPk2XxBph/D+7Hamh8
	bFch8a0jCohJfj8XZPzoaWCAp89JmllPRzu6QsoCkrLIT6b/KGfijSopJQ8usTGi
	uPAqbh879kGzTfR/5J7NpcJ2m0eQXuD4mTw+w82p/s4RUt4ODp2ibiGg3osBxWeq
	966rSQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91930u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 06:29:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so1539693a91.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793082566; x=1793687366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=;
        b=Nnld3526dJYvZg2D0po+GwQiiq8RqPGhpH74W6AoBCgxZVAhf+9i33BPjzr3J8N6Gf
         bumB6iyvHwIhzWbEs6+iqz3svoAcVALECWookEdY1WZMAbrpRbmcx9K1Yg2nE6mkH2HF
         aLHuuG7Q361NtbUEridVBM3HeYbFLSlq9cJhJGFaWbeYaoHxMRp/KkzDEkHc3mDO58kj
         WQrgqASq6lUG0uVV1628ovWMXydzJJMFkdPKsCpX0lBQ5SjwUzilm8HfRicQiegg2aDI
         Wt+ivf8AvVCninL6PqKuKDly4rtOPcJdhexuO61wzIPwipqHtgjNxFgZUrpc+SnSoQRi
         xxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082566; x=1793687366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=;
        b=HPuCZuegzQnFUjsbs6w/p2D+8cLHj05h0NLBdRHiQvqiQgRVtXZOWydfjrid+po8t3
         kVLIxAJ2334LWYTnAYgcwdkNk9r6joaEPKkWKKl+963AxoPkxswlCDs1bfmtZfJoZfIO
         es5pkTzPpf0CCFOFw/V1+NhxArj+4lajsPactzbDppiUq6MbVYHnLzb5SJkTnk2UbW+S
         TOODZ1EB90WRiKqByZc7EnPwUmBnyohX9S0Efg/c4tUSUjdS16ZjFnlTq3at1be7KNh5
         nXaCdlyeVxVapNMQr5rfDbV5VvC4zdT9UO8/fDOz3cELmIqlBw51WATb1tb9tMmY7NEC
         usKA==
X-Forwarded-Encrypted: i=1; AKwUvBx0JCE3aUtkRrwwCIkNsTpP+BquYa+CzwB7GyfAS198rpAPtWR9haORAqaV0fIhfRgSaXZ7g0KYoiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKr60Ip9PVGEBzPT3Dw8GwkQMd08vxWsw0NYaYwTi0G7ATfwcj
	3SjQRZ+KAoZMMLpkjRmw+RRom8Y85odIZ2aDJY+cctfwnYu08Zc5VXfduKcn2JiFVt/+NVxvjZO
	lLAkvALXbnqOjSgi/aCssmE0wPPKauRK+z5Suow+LaUVSCC/uZXTa9OJEHLPaiUF/wx7P/eo=
X-Gm-Gg: AYBFou3oLOoChD7Ei/2TX+6jH2JkI9O3ClSByefTyK9D7SCyK8SZCFjCeuHVsT/8kke
	Y+yLUynFhRIJERFVw2nFY3LMq48Zj9UpZ07wjOp2Vs8yxnnUlwrW5GB0jnSc3d4H7kz/czgMoL1
	q7zwmSRhMKouCPENb9VpOfxehi/iy8SxiBu8AN/YMIoBTzxn+q3jW+9Jla9HFIZ//hJkRttAd+e
	+iciZPHDioATqlQE4JRLqYeGf5l9Q1gygTpwEQp9uTrQDdq4mZ4ld1rcU8HGHXQpSprInId2gQy
	x9gUliSVgqKuZihAzV37Jj28r52EEebrmp2WDVM3Cy4MLoJfFiwZ42v3D0WSIXrUApknyaiRbb/
	0cGIMz/4UCDnGo3WV5pRgL1YVSS6yviOGFPqQSohwmo50tM4qQAnsDxJHbYJa4P2NsRY2banENK
	U=
X-Received: by 2002:a17:90b:4406:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3adeae6d6ebmr6442719a91.44.1793082565740;
        Mon, 26 Oct 2026 23:29:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4406:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3adeae6d6ebmr6442693a91.44.1793082565262;
        Mon, 26 Oct 2026 23:29:25 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404ddf1bsm2216463a91.2.2026.10.26.23.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:29:24 -0700 (PDT)
Message-ID: <34a17861-771c-485f-ba41-6bb2d539ab3f@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:19 +0530
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
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FdUjatoXj7JdRDNrO4AFyLissscI-48h
X-Proofpoint-GUID: FdUjatoXj7JdRDNrO4AFyLissscI-48h
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae044c6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=X_4YwSRDM6R9hu7WxWMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX0f7kvMkX7wqM
 6OsH6ekTDS/cZwVlqQsc0hEIzfDGKBSuYNu7uHARn8TwQynTCghuufgedrplx/9oymtG88PGrHv
 9aA9dqaTo/DEdBofhuVWvOkUnRPIPjJe5fn8JNjLR9layWuToaEXoYHGa2ezdLuzRcpo04Qp4W3
 h/Fu6Jo8S8pm9zgd4XW+1ypfrBz4uyDlao0lr9RDrumB2zBobbqr498glkVGEU5fAksgkhvmDi0
 5u6ouRX0I4eGQcOM17Bxkwcue6xFPoeyxAtT5dbv75EaQIyMG/KF7G8uiRs9m4kuQ4aBkwhANCv
 D7qc/Eoe75XTdDkA7migyS70ZCQb6U9Pb2zHJE7MmVbdUPj151/4DNYfNU7DDV3/o3IyMRYtFPj
 PCEEZho8RtBtuYABUg415B01HxvNVPU7P5OxD+T8n4OpdczeiVcI/ffYpsfxs7KBU8PAs2+q2Zs
 qooHtycB2ogzNLbMLZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX1zMrF4cvWmHq
 jtd6RRXyJ/vxzo7/8OUXpVolZrEZZQwFHi9rG+GYZw/OeNEYdpADQCBiqpUwjY14WeCiYLMNaA7
 g0+yzyXLm93GJMjtfOIwuaA96awpEJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270025



On 10/27/2026 10:05 AM, Ishu Brar via B4 Relay wrote:
> static const struct qcom_cc_desc gpu_cc_sm7250_desc = {
> +	.config = &gpu_cc_sm7250_regmap_config,
> +	.clks = gpu_cc_sm7250_clocks,
> +	.num_clks = ARRAY_SIZE(gpu_cc_sm7250_clocks),
> +	.resets = gpu_cc_sm7250_resets,
> +	.num_resets = ARRAY_SIZE(gpu_cc_sm7250_resets),
> +	.gdscs = gpu_cc_sm7250_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gpu_cc_sm7250_gdscs),
> +	.driver_data = &gpu_cc_sm7250_driver_data,

use_rpm = true,

-- 
Thanks,
Taniya Das

