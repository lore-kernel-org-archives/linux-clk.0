Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B42652CCFE
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072853; cv=none; b=YDby6i+xw4NzRH1vYFm5WJg0l4R12k1gMn4tNCzvd/w9IkfaVA12uhqii8Z7GAJ9NQRB+Gmn5YzsLeORtE/Hk88ngng1akXCrEvXStLt7PJoSmFis7DjV08c3CzG80/4JqnrM81hIYlupJ0lKEDF1KemeCb6HnR2fd5W/6PHL+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072853; c=relaxed/simple;
	bh=AX1weSWRV9L7p95o0pE/jdekN3jEDZy7K6K5FfoK1Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKKxC02UT2TGL0EtmJ1UaauevTx0Sc2Os/LUx/Rb2GPuRtYLUC55lxD/Hgsc3Ck8Hn/HzLM+aNqQJwxOMXOcMOKSEq5uGwTHIO13Gno6+QoC9n5pvxP2Q2mPThss8nbGTOrxFxbngLoXFNqmE2bxQmmtjc58ZIxdH2wXgeVfyc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zp217iie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+UmIWMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zp217iie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+UmIWMF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPun71596368
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 14:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GyhG3f6yky5p2xQIB9m8xigN3IiQFU+DTNcZd6h+JBo=; b=Zp217iiexVdzugFQ
	6uGpP7ZvYbwSQKIsaCJ7mubpI3FYKoj9UqbWJ43LZ6TSBOjV/MnaSvMBVmAvs4UC
	igBPFB7ZpxFTmml2sNiRUOm1p+11/YPqmH/pShFw1/yk4s7ODSdMa48WRiZWiQpb
	63Umd8cudmniKleaJIdoNL5guTH1lh+7QdQDUvlw5Xn2Fs4lqM4GpHF4Ty6Xn79n
	uiuOmZVAKADF6H2wztyVGTkX8SroHaLlXsj+HvcfvtTUabthHoPVoOwODj/ymNPR
	CSl/VWyLnjvWktfb25QEmI6F4CXvpvh+Bx1CeY7wv69EIPTZ820DY0CiWJJjxm3a
	Z50fMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8tdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 14:00:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e834ff4d0so1400358585a.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792072845; x=1792677645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyhG3f6yky5p2xQIB9m8xigN3IiQFU+DTNcZd6h+JBo=;
        b=Q+UmIWMF29UdzW+toemaQXtJyE37fs/lKNAlsGMw87i3aWnroqC7mgBcLEbZCt4Bc6
         XP4PTBMhycF/BntxjyzytUOS2HaA/MoQKrMO1ruenx8Pq4dkszKzaD/ITba1Byx/LZHd
         sjOMgcQHXM6+PXa90Vsow6UBSwVWt14+/cUsHID1TxSEWf3T4SUGh+FGSqvGjBUROlYU
         YrTcOwzDXgCa3FEI7BmMRV/I90gSebXEk4S8QqZMDntMu67tSMDHSFl8SdmbOFbaFbyf
         X5Z8j0Z7/SdHULsvaPJ/IYQV4vHaeM8CckMzffDwJAHQYNPPO5lCKVniHHI3ZcMZOWrk
         Vt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072845; x=1792677645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyhG3f6yky5p2xQIB9m8xigN3IiQFU+DTNcZd6h+JBo=;
        b=K9GmvYLkkShsiFUyhSjbn2Mrsl/498wCsEH1ohOy+YAtzvJ+MI/8Z0hyEk4i1bzaPu
         9mKzfWiv77obSqKV6aRoUHpfLy5v7KV5EN0N+wnzSXjJfuTFbdflyTE4yKGif9djkukR
         Q4CRHBxHYRUvJuF3DJs3YkIxZyZFVS9M330gfxh01965Kt029Ot86yygREWfWFPrWIlo
         kGwg7catxweqkD+jlnU6cOIzEVG2eT8JPODmbdAjEo7TyHy0fCfw3Qk2B6hQpU3uu4Oj
         2bznEfUENTDFzaggzwS9tc79Nf0vwPg1c9Dmh8s8Qc3yMmsrz10ZAFVGZ7tkxzD/FpcI
         yUBw==
X-Forwarded-Encrypted: i=1; AKwUvBxA36mDeGFQy6JwcMjbOeuD3ep5k/VLaaHfD9wsdYIU/9kXnFmxYYrfnq7Y5pEGRgNRAM9mutXerDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDhz6Z97e0pEx8CKNOyBc1ALQBSVWFo5UrhSeS+nRvhXvT6O2g
	vTlYEatLq3dHApanOlQ6ZC7bc4tXMacYnMUsOkLxfbi2QmkkhcNWk1ORj3gEYgJICoLtLjWxNfj
	La51QfU2ZgHHAGHcYwGOoLodKU4lh3FiYB1Y6TQnaGjW/30R0kjvlYz5odK/qA20=
X-Gm-Gg: AYBFou3z6tcGP77RXthH61+DZAeoqHrt5jWA5QMCeLZHNwsRwtlQP2lMfblKkShjOg3
	d5POO/fIm9FBoJu8l0bua5MF3JjdH5czU7Zcs5Nqg4Q8sJEuFYnWomFOufuox261kRMGRm1mLcs
	rkHgnvO75MpekpioQxHVl1yyJzEV3wmPndq1bySZyOGvxjS1AptncBuNtP4YCTYHOsMUWeisQZk
	1NWlfUz5vtaTcjqqb/+3fi/nCoKG56QPd9amU1Q9BoUR9bCD9W6qSN5R00hMv+jyxEZyd74TJcK
	Wt+O339Zz+kzu8zdTzrxdZ2DzfUl8aGTOSFQ2dawJBfM0QZ/aYYT5SJr/nxiVcthYCj9YRDXzgx
	PsEIvzNOQUje+8aYrp97OumFzspr5gA==
X-Received: by 2002:a05:620a:438a:b0:93e:a8c5:1340 with SMTP id af79cd13be357-93ebd25394emr3089508885a.34.1792072845119;
        Thu, 15 Oct 2026 07:00:45 -0700 (PDT)
X-Received: by 2002:a05:620a:438a:b0:93e:a8c5:1340 with SMTP id af79cd13be357-93ebd25394emr3089496785a.34.1792072844394;
        Thu, 15 Oct 2026 07:00:44 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.197.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b32ffbsm129953566b.34.2026.10.15.07.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:00:42 -0700 (PDT)
Message-ID: <1a3f3b8a-fe88-46be-ad23-38c4da650183@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:30:26 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfX+HwdVL4kHmSF
 U4qB/+L5YGJMg6O5Uk8NqEvIMiaCEndkDdIv3dZldE01rYiaf0QYWu4slUQMISBOjIrGYz5COzg
 jlap0W8y4/lGEvflIa8or9M/oTw8Izpw1/WR8y+0YCt1NCvEDQr8JIGMTx7xdGRM3xK8lkNLabp
 nB5jjrs91n7n+okFGm8ZBMRgwwkdccVigJaAtMm/d3UHpXHxi1MJd1WLuqYi1nv9K7hLHzVZkGD
 OHHpJCJT6Rf5flUkJwS9RZ1pxG/zMjig4Ux9uzcqGig3Suf16MP6eOAV/ZF/jLa69YtypRPGETW
 3WrsYtDSAW/SZlEcBydLrDuOTdhgzGQPVFUG2KzPaa+48giM/r7aHtQNIa12b5/RFXltnD67vRq
 L0LFyCzurpFZGblYP7/hop46aXMPB6pwSLRv+L9oXQttahg9fiNCka1glwzKBr4MV8uOG+XJmkT
 +9hVQ5ze4VX27uWpGuw==
X-Proofpoint-ORIG-GUID: Bhouxge4YWoJRt-6vGnvVTfWzvjWt-ET
X-Proofpoint-GUID: Bhouxge4YWoJRt-6vGnvVTfWzvjWt-ET
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0dc93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/y/JNeyFYS62MWjl30sOOw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=erN5cKggTshIPlD3kWUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfX47ahndM5RPs3
 s/EiF1kMSDgEX+rG9YEAUvz2RtREphGYTuUrlTlTNhbktsl8vQm72oqvzc/0MOb5qCCXgQj1pBs
 s14c63b6oY5hn2wqKLfNAycUpkTk+j4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150055



On 10/15/2026 7:05 PM, Jagadeesh Kona wrote:
> The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
> Hence remove their clock modelling and add them to the GCC critical
> clock list.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
>  1 file changed, 2 insertions(+), 30 deletions(-)


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

