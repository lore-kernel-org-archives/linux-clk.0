Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C8E38F92F
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782878841; cv=none; b=UtSTxX9jp+alav4OVpHZiMWotg5N1sMLQ32/q04czl6lhPmq38QUiogHWB7IrieEmTjlDBc+08TEy4/UGzmpza4DDnb9OO5exJqjljuOWvMrccWoljll6qdcHi8PiivktpuYzC6AROYzjnYc+M8FF7yKUMEVnnI9ImtxiuK18Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782878841; c=relaxed/simple;
	bh=iQKrax4xdqPBaPK/ZY7NeYmK8KG/BYaKFf94nhYGZzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOpEQICidwASMSN7vi80IY+BZTOYqYxCGzg+bFE1Ib/XlaijYSOGTCidgcFs5l/fl+YMFyqfUJoHBYR4Hpwa7V8sOaQhCp1KVVJFl7zaJcIpHGC3VcpnMNOlJNLltW9Pli4LSm8V6zCEsYrKcrB6GBnPyYjE652xNFTNxkIurr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzlqCJrf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EY6c/xM9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzlqCJrf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EY6c/xM9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6612tOKB3876385
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 04:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXPC9cfbhTzc7btajVjYymebFkcCjufLQIb57VfBcXE=; b=PzlqCJrfaNO8CRPf
	wYIOEK9U3N7rahR2BN95T69Hvw82aNxO5GR1JExujtgHlP8qP9NcIBOMCXJsqK69
	Xll86hLDgShe6DtclVc10RYZQASPHxTvC/XtF6whoZ19CIyZ8gKeEwQGom2fk/BI
	z5qKOoipK+78sAAlARJCkY+FhnV3OeScIRpVC50n6oyTv2W36csBy1bj+W3roZNo
	WAOGnSOuB4AGh9MtBshXDSyj1HBfzIIjjHg7e7KhVW/+VE6VhJIQUVP5AF88+mgW
	SvJkcAQuxbOlWF+w0o3t4VvghtI/b7e2XkmzboUSMU66XGKoXzLQvRhqKoMBBW+r
	tEhiZA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqj2m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 04:07:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c62861b3bso777837eec.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 21:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782878831; x=1783483631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXPC9cfbhTzc7btajVjYymebFkcCjufLQIb57VfBcXE=;
        b=EY6c/xM9mDpDR3LI3WJT0q9OAlJ6mVosrpVtTIYZmmJXsB+qEUb3Vqca8yuxhSv/bR
         148r/Rpe3XW73LVM3LGFsycHYMz80ilgJzFFpTEbng692WohO6iV9EZNOnjB1rgzwTDE
         3A/sSWniSG5lJg4tONl90xCO+pmVYiK8rJM5uCkBVdBdp6FjplW854G8kPYfDWpNnbVP
         gTcIz7bu4CnnQIwxgAdM8pRTe5xy0qxKq1Ydvjv+Nun2vKdy5nsZHeu59QPHhEy5nXd0
         SOrVwy5XSyxCwvWpTdn3yHvq7X33hqWbRcKAVSuQdM75H4ZWwZBMGrg8YAIsC/j+BKyr
         ZsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782878831; x=1783483631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXPC9cfbhTzc7btajVjYymebFkcCjufLQIb57VfBcXE=;
        b=on7GPCnN5SiV4ViOnIekbuumF0JJeXsEJsYQqfIth297swmIINOQguWWiyvjcQQfMP
         Hv3LBJ59/GlEIM/2MVcN4gzFU/8Qbiubb3aUdbfRvd/knTA0eYGXL7rVnXdRoxN9lN2P
         ieEwWZqtjM+ZW7rpkBRwb0l0bT1Bd1BLrw9hpBQKwQzYl/lWrXedTDoRj8vI+uVJMJ4o
         KgsV7GWwP0prx2Xc1bBqzTz1T6zR1sKla1RuM4mzUKAsPPpfiwac+ZJAwBZbIzxdjS6a
         wIUoxOYpmqFgEIKQeYMUnlts2NPYTrZDgzkjztc55TnDxwXQ3d9snfTqEzw66z9GLwJu
         5VqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEG8xj9HJGtGIssan7ivE0O4wlCb11KfD5nBEaL372uZPCWS+3KzsDFQoeERMwCi0u+SRR7pLVMyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzcWVN7K9N5ps3yHP86fQ9h4c9VCwhwNS12M748brBSk1NjfRO
	ln8bN0ZtJAq8SlcSpO/FkActg986heLlJxa1RfBXBulfOlos766ig9g7zgcb8fm4LrlIPWUkiE1
	TijecKJJLwnIXr6d0zyyY7ArvqYpoNVHI8Dj38W/OVy6UybwomZOMAkQeSC8XzRY=
X-Gm-Gg: AfdE7ckZODK6VShJZwNC5ID4leOfDJse60yCKTUbeAmRnKQbaySxSpVZUWglOO3rQMi
	NceCPFUV+9R3CFiKHlnP/ePsdSjQrzqnmr0ITvJ9vV/p0TZT6JNcT6x4Ft1PIBFqdbYT9FjSdI8
	k5FchYb7sAHHT2+2/3FYhnl6E+s23CMNazCOlUzPkfCXOM5MOSv3zHHcKx8mHDpdUmSNHWeoVf3
	FnLC/IXdZ7ZGk4tRdV+J+VUfDacS102GO08ANNmVtVgQkBd4/t61CTLBCwgU5/Lb9qXbQLbJPI5
	Hu8qNisk6cOHuCbqPx/Bpq06YR1VSYeDpKHlHJvfQ7J1ugCItUiQa+Cv4HwPXuyMmdlKHlB9Tyo
	xR6CQAqvUe1foV1mXPQQvWEaVY6MVO8/gXTZ8OBVpLQ==
X-Received: by 2002:a05:7300:6d95:b0:305:56a:c38f with SMTP id 5a478bee46e88-30eff2a2572mr11060eec.26.1782878831446;
        Tue, 30 Jun 2026 21:07:11 -0700 (PDT)
X-Received: by 2002:a05:7300:6d95:b0:305:56a:c38f with SMTP id 5a478bee46e88-30eff2a2572mr11010eec.26.1782878830841;
        Tue, 30 Jun 2026 21:07:10 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ef03a6f9asm7249363eec.19.2026.06.30.21.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 21:07:10 -0700 (PDT)
Message-ID: <56ebd97b-0834-41ac-8fdb-2469e2848694@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:37:04 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zUMy3kWerkG0WvDglhoIsdc8ZaUu3C1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAzOCBTYWx0ZWRfX2dQX/FYke+dM
 UBZlq50B84RMQPWfcK/mrIt6Zuz181nVPfsrzsqkX0WkvTywyNw7knOv5SxlV+EdGQxlLLmBBWy
 GEGxQm6knBUQ0XIJwstA599jZ6S251mL/ZU52Thy+eAf5Yuspf+1fMKu8kLGEb3SgrkMFSuEkg0
 4nKMFlm5I6pKP9/XLaLhopdDZWm8XGUKKGyfvsq0emgHeBH4lcHETQcJ1O/LAutUc0PCK4W983R
 BtZS78ipFCzgdNMJVW3qVEEBPg7LC/W5HQXSnzEkQHdDwoRKp5qidYUqaqg7KSsOvvqO3e8aljd
 So7gYQ8xbPlO3Zs1GW+3gE5asem4ZMQhq0/rNr4UE/YkZYtCLj+YFgxN9Tctsc4OnuIhTOiMy4l
 lp1vwHeJcpHwzoxB+Nt7/qCh5pfSCIoNfoTalxAfrXxJxsKwytCk7LCkFC2zoAWl7FumA8s+G8U
 ecbOx10mCBRH/noax+g==
X-Proofpoint-GUID: zUMy3kWerkG0WvDglhoIsdc8ZaUu3C1k
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a449270 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=uyBkinp2FPxe1pn4hbAA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAzOCBTYWx0ZWRfX1Uqy7o7eZDno
 0Nj+B9j4nDY6yJlctvdbtrO7K34mOscI9070iHS6E3SltOtQ/MZV5JjBvIe7rh94f/16M4ErYJd
 0t0Db6bJzlZ9JWNKVxfMJmTqXtvzN3s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010038



On 6/26/2026 10:02 PM, Konrad Dybcio wrote:
> On 6/26/26 6:26 PM, Brian Masney wrote:
>> With the introduction of sync_state support in the clk and pmdomain
>> subsystems, the following warning happens when the unused clocks are
>> shutdown in camcc-sc8280xp:
> 
> Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
> the sync state from the clock part only resolve this? There may
> be a clock dependency for the TITAN_TOP_GDSC that we're failing to
> describe
> 

Hi Brian,

This probably could be due to camcc_gdsc_clk getting turned OFF during the
sync_state, but this clk is required for GDSC transitions. The camcc_gdsc_clk
is currently kept always ON from probe in camcc-sc8280xp, but the clock is
also modeled with clock framework, so the clock can get disabled in sync_state
callback now.

Can you please try removing the modelling of camcc_gdsc_clk using below diff
and see if helps here?


diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index e97b8d4f3c84..660d8655d391 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -1753,24 +1753,6 @@ static struct clk_branch camcc_csiphy3_clk = {
        },
 };

-static struct clk_branch camcc_gdsc_clk = {
-       .halt_reg = 0xc1e4,
-       .halt_check = BRANCH_HALT,
-       .clkr = {
-               .enable_reg = 0xc1e4,
-               .enable_mask = BIT(0),
-               .hw.init = &(struct clk_init_data){
-                       .name = "camcc_gdsc_clk",
-                       .parent_hws = (const struct clk_hw*[]){
-                               &camcc_xo_clk_src.clkr.hw,
-                       },
-                       .num_parents = 1,
-                       .flags = CLK_SET_RATE_PARENT,
-                       .ops = &clk_branch2_ops,
-               },
-       },
-};
-
 static struct clk_branch camcc_icp_ahb_clk = {
        .halt_reg = 0xc0d8,
        .halt_check = BRANCH_HALT,
@@ -2839,7 +2821,6 @@ static struct clk_regmap *camcc_sc8280xp_clocks[] = {
        [CAMCC_CSIPHY2_CLK] = &camcc_csiphy2_clk.clkr,
        [CAMCC_CSIPHY3_CLK] = &camcc_csiphy3_clk.clkr,
        [CAMCC_FAST_AHB_CLK_SRC] = &camcc_fast_ahb_clk_src.clkr,
-       [CAMCC_GDSC_CLK] = &camcc_gdsc_clk.clkr,
        [CAMCC_ICP_AHB_CLK] = &camcc_icp_ahb_clk.clkr,
        [CAMCC_ICP_CLK] = &camcc_icp_clk.clkr,
        [CAMCC_ICP_CLK_SRC] = &camcc_icp_clk_src.clkr,


Thanks,
Jagadeesh

