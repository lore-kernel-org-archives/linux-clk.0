Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170520;
	b=O+6/cjO/vLVc8xQT1mfWsDjfXojP/vY6BHeHrRHFwQoCvI0hfWt5UsAkyGwue9HZk24B
	 CjQHnis29lKNUf+mEEp6p4syfjsY6M4lwIwWJGYNyEBbsJWwqdi6XyobsDt5gGcRYNR5K
	 uTjvH4tJVmTtiKSh9flJvmdicrWBqKnSkCtapnmXlfJ4XJfOEtXa6DO7JQcT1lWBtFwEB
	 Ks4gdtGLmgEHfl/BfzluPSpDiOUxkdc3JTKyCgivtB6DLD5oywj7ffmFcV4as4ELj0Efj
	 QLLZ4TPDkX/B/io0vgpxqcNNMuLTTMARA3ZuEJ1WLVbBIzwiG+NfKc2NrJF9Lnx6x/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G581ycX6Ku6kP8YxR7osG1LQa9jb2ypNNxCsAk8tyrw=;
	b=M31nGulRiyECZZ6ReP7u9jYFVN718v1PRRxKzyDaXdCEg4C5Qr8jtsTIoQZQxpczI4rm
	 G39/tDKMuM0JIwiSUqYmBUENF03BU3R/Zofu5GetsipSC1FoCU4SyrjtQK9NqNATsUaxl
	 g2JjuzJcxDp8fm4KiyBq9SgiuI+Kyvkx/ToFJ0L6zCr7Rwz2/yWaPUXzOun/ZsXImrlrr
	 IKBu6ZSUudQ8L++EBvv1/SiaaV9jjPLcIqjn0om90lxOH4Hwlgfds7/t/jZNe708WVCUk
	 LAcQskASCFIwv/qhVYuzkrnBBbXLXbcufJY6+SItOhNnU+lxlzVB549X4XcEwf+8Lhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJfDmle0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KtRM+F+r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81BE606A33C
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81BE606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJfDmle0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KtRM+F+r
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewP3605912
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G581ycX6Ku6kP8YxR7osG1LQa9jb2ypNNxCsAk8tyrw=; b=IJfDmle04u+tTfV6
	e2/yVasOZYYnS513Wd2IDyWdMIi23/8unEsh6HXrFWnKKFZClyi3xLH3/WgQ77of
	QzsBms+5uwZVvfhcKJPg2wDlPHQPfivH7i+MAvKitfV2UTb1GMwhrKZCDFHzeIl1
	pLkqhOgm7sXNgKO7C4l6VTM54eEbPcYzjPCXQvToDADnzqvf5JgU5R8tTv1uu9ri
	4PdsXHUeI7vo6E7LZQ6bLvcWuL+K+Pr2a/t0JbAATk5PZO+6lzN99ZVFNu/3cj/k
	aHb3mKexVxbKysHb0qhCwiM6lU6/MnHaL9R3IAZn3LrzCYp22n9ELeYBb6ubA9fn
	ywgnxw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs2y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:28:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso928398eec.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170518; x=1795775318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G581ycX6Ku6kP8YxR7osG1LQa9jb2ypNNxCsAk8tyrw=;
        b=KtRM+F+r2STkugosvgSpV8uue1bGGC9T0NXWgHBw2q24FE9lszZ89639mjR/OKGTPO
         mHs+48S6E3YSAqh1fX756i3cFb0GOUH6/AoKwq2NPB3wOdc4dOHSsjNkkQ6EviPqgiyG
         MAIOl1P5ymKWrgGQ3abF1TZNjXNA4uZ43c/0bOLVHx5zyIodbyAhjTGk+BxE+bgnZ4Gz
         esSE5MeF8xU2mRdb+g1l+qyT5h5zP4doNRi6dpnYAd+4yjaxwYbcZSpkzuv8lSLMcvDu
         0cX1yFuLHnw+JrvkyUESihXELmo4M3RMZ4tHEbsntf7t2KI3tpYT+7VZkor1JTq8Zanb
         PT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170518; x=1795775318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G581ycX6Ku6kP8YxR7osG1LQa9jb2ypNNxCsAk8tyrw=;
        b=S4UpMhUg5KG+2sO2C9mvWG6IIEC8Vyt+jTpw5NfR5h5Q8WMsQQ+HI5XqPbf6x50Ds5
         slh40y6CNkuiq1TGAQJxespS++2rgRiKnOv69lj7GN9KErRkq+1lzHJe9ZVUMmzQ512Q
         LoAXEnljT7RkDcQ6Td+FWLMqcsDY5KZeMaANNorqZoQio14q14Rrwd5Jc8rvZGf606Ce
         oQBA2MNCTB1xxVK0/+VTjUvOfm9UIZmdnZNE8lD4h+P7+dMGlyfxWrEOvnEq0YObA+f8
         gZWEDMu/4hpbOFWawoxiBkFASL0xasPlA9gdDP8p/a7QQBlR7SkHGKG1tuF2VNJdfXjl
         kbXw==
X-Forwarded-Encrypted: i=1; AL+hErFogZ0BXyovRQA7jl6bLozJtUw6Ho4fRzd95Hi5AhPDigs0kwNiW/nPNXSl3vbZevoJboq8NNjFCio=@vger.kernel.org
X-Gm-Message-State: APuU4Z8276ONPVv/Ij5NksjmI+nxqUrZgXcJ+a8NpRA+WZTFas2F/ixm
	2/X/G2GHcHBzKOL3Zf3ujn2wJ/xIDugSCprqyNAMDtYMyifSxpMPTS320OswyxonwyNZAGyDEsG
	QpgPCH47TsrrOd+xJ37IaaTg+bHak/38vSWpd4j0EmIoADLxUTcwzUn68o0chmaAsnexz4w4=
X-Gm-Gg: AZFdTZdx4P64tDa3sVpOZb3Prj91J48k7qalNlnqgoE0h+vVDCLzCkGv4m8M5WaT5PQ
	Ko0l1OOTKQo121zzhPCgRlw2yFCHx5/+hm0RjH0vCAB2bERYeJfGddqYeb6Efe5U6c9PJ3j/kAW
	7UsoR9I2ix7JOpwFFOHswGstlOwSvGYxtyNNhR3pqOKhQJnyt4eHVvkD4QbMRWjzYTCGb8LTIz1
	6KzBEud3RGUtGaa7OrkJCjIoccDD5ztOaDu0dAXm5AMkIepn5cx5VKRM5gJhfd68UOfqaxzJ9r0
	1otMwDBCobFPi7Kn7sz3cKZn6JMwOCTMNOreUOxztPkH4exjLVgOUN98JKabUvRMKhjvMGK4p4v
	Z3a+8Ye5zVE1ARaDVrwnYjWoWw8J0Y8pHE+IN95AcPgWOYg8B3hbp5OtYTJZyI7ECR444pOoep3
	F+Vw==
X-Received: by 2002:a05:7301:4c84:b0:36e:371:8255 with SMTP id 5a478bee46e88-38569944070mr2039956eec.0.1795170518217;
        Fri, 20 Nov 2026 02:28:38 -0800 (PST)
X-Received: by 2002:a05:7301:4c84:b0:36e:371:8255 with SMTP id 5a478bee46e88-38569944070mr2039930eec.0.1795170517779;
        Fri, 20 Nov 2026 02:28:37 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm8572641eec.11.2026.11.20.02.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 02:28:37 -0800 (PST)
Message-ID: <057574d3-b5d3-4617-b9d0-1c68d6fadc5f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:58:18 +0530
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX0UGPa5HobJe0
 oUyKIdNX2c5F3se5fEHPjoGg/xix/YTLCDgPYwBB3Jz1kHHn6KyMFgEl+uXmCdqzmeZeHeMuwOL
 N1E9rBr9rKPk/ph9rXQNeLHGKGewbL0EYXo7Uo763zFC5D/CWPC6OYlWP3Yd9FL1JumrQMGfH1a
 AMN+X+QhO6zJc4HWlYMwmrVCgxJ1ICHxSdPpyiONSG8Ng8RJ1xqkwYa76EwkURnlBgrbE6deaMM
 PzPbaHHVwRy3PC9hQdzV1UF4HkosCjsXWfk6KkZrj4w2WSMhSI0n5xn+O8oL+4NNB8upvwr2GVH
 RXEo2fvdw/ze5NVcJfOWahVen4UHBblebZYTDrXBng+/VW7ABnqzxRCxL1GhnVSJ0OurDUL1hQr
 qhJ939tG1Zo0noMJsF/MQUhvkl8vib0irdqXK+9w6I6QOkp3jeM4QnAbeX3A2cirDwz3CExIajN
 CE4OvFcCu4TqJ0vH7Mw==
X-Proofpoint-GUID: QlGrOPosCDUYXtWK4-kwocbU--PDEKLj
X-Proofpoint-ORIG-GUID: QlGrOPosCDUYXtWK4-kwocbU--PDEKLj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXyKDg2T0Zti2k
 XTZBxfomFWEL7/JLpoK1at54UpVBMl6bU9O8fx6tsqOzbto4Po17xhvxlfgr7iWiC/0iILTnrpv
 jmeEVK0GoXRIsXt/4b5clhTvo3GSekU=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0020d7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qo5-9WyrHJ9SuE11QxkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200041



On 16-11-2026 10:57 am, Taniya Das wrote:
> Add the programmable PWM XO512 divider sourced from bi_tcxo and make
> GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
> PWM core rate through the common clock framework.
> 
> Signed-off-by: Taniya Das<taniya.das@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/gcc-shikra.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)


Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
