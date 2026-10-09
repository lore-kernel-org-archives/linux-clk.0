Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732343BE647
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 04:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791520050; cv=none; b=Q/6g1RgdWVaxCXLkZMD0xXybvud9YrVDDhGpFj5rk70QBkic5Ira2XY8ZyIxKTgK10NQ5FSLak1M21djOOC1LgO/V44AsOKw7eop5dYv8MFKgc/6Ne38E1VkpYczyq6cC0H2z/eTe3wf8oNv8J0dCVawFlEiqb3xPykJtYrMvoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791520050; c=relaxed/simple;
	bh=ZeoLU89FpNQ5WWZSpQlolueyWpVsLFUHDkCpRd4SyIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kteySa9dLBryFk/E5CyMDe0Exn0sa5B1+7qiQLbiWriCa6adbRBssG7IGa7KfZUHgNAdh38ouD5N/A7XfShNj6h0BSChtAYckRiGCpVXxh/NIQVhlBtoztxtP4FDRLVn1kmns+ojTnEXnwQleX0PWDWY04WzOUXaH7yTLN1waHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moIzNgYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCTShhPC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moIzNgYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LCTShhPC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HLAF1089382
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 04:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YqjPcnwdH7+ETjZMBxsavwMVoe0aje8ldA0u84RYFkc=; b=moIzNgYIlMRmnpNn
	tG2cdy+L/vF65olVEALzp41v+lVoQ0AsDRQUgQoKKuxKcwHVO1/vmU/JuJAZudo8
	zYAB0kglArK2XDoBEb/ExDWYyEcQD2lLEAYWVcr1MVBYwXapehEZg2BL3Vj6ct0E
	PojKkIMu/eQHrICmaXrvl2N26ffQpBqUWLEa2FqzuoFCl4DAMDVrhlNCPerz/uUN
	G7E2EJ3TO/1pWenm941nLOgDzwQONF4FqLg7sjmRrD94a3Qx8+wRdmOAmljBuXOi
	LZllH6akDhv81QAKUnrLE7X4/fmIKHyV+FLQXnN+neprlmuHMSTP/yTQj+FepSwI
	dcfTkg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekva65y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 04:27:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515d2fc5ebso10664301eec.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 21:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791520041; x=1792124841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqjPcnwdH7+ETjZMBxsavwMVoe0aje8ldA0u84RYFkc=;
        b=LCTShhPCRPDpvNxxhVXTidlm1dim4vTCCg1w1zEJh61u0lTesnCVla5Zrq7WBD+fSY
         L6At00BY7MS9m51Q9bFOsxa/JynOfbsNpSf/CfwAondXaJY6z7A8EqctD+qiZvpN1P2Y
         M7g53q5/eP4Iq/LSYfYBVdkE2IhrQW8QlsFYUDg8LsT2N+1pkD83qi19x3KJG0AVwMEr
         +N3ASSY93Ga6w22K0yl48WVMgL4XI2iHT/MV1/MKLzK+8BV9m4um8ytE/tx4xFIARPbX
         PuZ+yDbYa402sjgFmX7neJ+RKetemIqVY2mEOMyjE3bOBZdWmVY1Ru4cvWnpVxN5CE6T
         ZlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791520041; x=1792124841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqjPcnwdH7+ETjZMBxsavwMVoe0aje8ldA0u84RYFkc=;
        b=vn1wAPnHYZPGZRKxxQ62QqslR+y4NgepkrbJp8K8oe/PnT62ut3cJA+ajaegJdlKEX
         kfMjR023nQxUYmmtsbfOR2mCUgw5+CiJ+rHbCOxOenSDBKPD4vEGNk00Vgey1Z9zJ0aG
         v4GUM8Awscvl34yTczz4x9BQGF6gsASUyakHIp13Is+u5tSN+9gDRhsrGL6sxThr6t1W
         BuFcL7noHHXSaGc5kKw0qyZ4D7q6YCEAyGXyzHW7FVwJd9B9l9nSo5Qk2HpZy+2SJinj
         CQz3e/0CCN+H2qmV3aZckfnpVNPcOYffVvl2+jlAeWtuCqrsyIn1GAxT7daFL+l7FDtA
         U3jA==
X-Forwarded-Encrypted: i=1; AKwUvBwUEbxyauk5dT32pmzRcaY9dB7/uI8bnqCzGJR8FLcWNBW/JAB531zKgT7ewlIsMKYQKslCTdo5ixA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIiBQRQq6cQkQCG5Oi6IvQ0U271VdAs2joN09IK9B0mkOYowZC
	jdiAYdq4+6ccteHWl0aRAMMm3oV/eAmyTaqkHCyfR0hCM/FKWY2X2jKCUAeoTNX7+WOPjw81tq4
	7wK9280a/GyK2GaZNfvZCmYnhTwhJMkTiBFdr3XC9dPQuCp/VpJHxKrRdnjeM6kk=
X-Gm-Gg: AYBFou2X2LLzXItkv23/Ye/Y0hTijl54IaclJzfbvku1A7YWMcVo0LZI4r4SrN5LjZO
	Ragl4k/hlCowncq98Ws5NE23xgemdsKzQOq5fIVnF1xCAt63GEqPTMVF28296E5Wheh+ykCYAkr
	LrkOc/MG7t0Qswjf0lm3uMT6xFOnFh0k/pBOlA9rlLFNQ3BSqpwGy3p3zjc6VZ8yJF2LIAG7kCg
	NFM/bRLscL3xwQKCyVU7rPDrQ4w6IhYGVCzR5d+2V3NUjha+Gr3futADWjIJF0xW+0UzISpSpNa
	x15BNpiUeZqY4KaTBLOBcawZW3lLZJ1E1wCAmpK5b1vKpWyDXcgWeVgSc8hl+VJWWPOB9TE29UG
	HNkC/W4zSd9DLRwGi5GPvfpng1xk=
X-Received: by 2002:a05:7301:8607:b0:351:595:739c with SMTP id 5a478bee46e88-3537e06febcmr1520500eec.35.1791520041143;
        Thu, 08 Oct 2026 21:27:21 -0700 (PDT)
X-Received: by 2002:a05:7301:8607:b0:351:595:739c with SMTP id 5a478bee46e88-3537e06febcmr1520457eec.35.1791520040421;
        Thu, 08 Oct 2026 21:27:20 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm2784797eec.28.2026.10.08.21.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 21:27:20 -0700 (PDT)
Message-ID: <5692798f-1347-46d2-8cda-eeec74b7a084@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:57:15 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
References: <20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FHqZS9MJv4KzZkWiMWkyvpAwdFnxuFFM
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac86d2a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=o3hcfxW_DcXKSnDgckwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNyBTYWx0ZWRfX55rcslHL68rX
 GQQ2GYcvM/IPJglVlxkAmI6yL/wCwJzD6dYoaN3pKN9Aw0ijfMQGFYBxAuG+ClYb1CVWyB8S8AD
 iaySbo/yHqEBhe5hONmoORdSu0Xnc1QJtwmOZMKUwA++fNw0qTE+OzW+aqawvuDyNgXseBCIPfz
 qsY5lDy3lOqEzt8501FEe/A/h7PSMFp1nM3Yto59hZvbuno3ggumjfH4/5N+mWivCWvhIUk3xLm
 lz7SzIQ6/Vme9BVUJfNMBJ1sLLXqGxVm2jGor/S55Rfl+D0RNI39El8VYk6vMZPAYKwuCyzBWHE
 NoR2utbz6JCrge6gzqz4gNUjrKWWAwwvagTGaVf2AsiZ5RX1Bhuxuf3JTN+OcUbeY6wQsXnXN70
 s8W1POHgpHhrnV4C0cNvpwdEKt/FQ7MQjYfGWhtQ+ivwVNPRqjJKqK6R9F9/QSLjvy0jjT8zRNs
 yjYCtybdPQhAZfbshNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNyBTYWx0ZWRfX/fkPMdPq9Alm
 BKvBP4niuREy6O3JCwJ2wh12jfFyYp3k99d0F0BGKtt1vXD08x98elXRwiZj0amlH/Y7A+zfFSz
 hxh+5XT24o8+QZiofO4OkYFBR0y11Zo=
X-Proofpoint-GUID: FHqZS9MJv4KzZkWiMWkyvpAwdFnxuFFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090017



On 10/9/2026 9:45 AM, Jagadeesh Kona wrote:
> Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
> the additional clock rates required on the Nord platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/negcc-nord.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
> index 68ce4d6278baa5888b277fb34a135d7e5beb789a..a72fce70de45ced4635e7091140e63b5148decfc 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
> +	F(144000, P_BI_TCXO, 16, 3, 25),
> +	F(400000, P_BI_TCXO, 12, 1, 4),
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 30, 0, 0),
> +	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 24, 0, 0),
>  	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
>  	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
>  	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

