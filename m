Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A34E141F
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 15:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449773; cv=none; b=VlrgAxxMa4l5EHI87VTSxWqIVAFmoSpH+f2yn0dUsxJgQ4iWk/zTSd3rWFsxHQvN24n0rnhwhR9RiV+cSKIu44/a5E77cMyCV5HduP7Iyy4fpDM5e6WD2ppWJKDwRlP2dicrZBFSCfa69NlkwD+p5eL16IuFxUDi9Vkv/7MW4i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449773; c=relaxed/simple;
	bh=V9D8GuQ4SakAuLfzhLF1uQ1WBbPG5alQqM4F4fDdBwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwIfW3Q5dySJkEYu+bKK5Lmb5tJpRwguNfhjjeJ5BgBGl0bbOemeQl8q93qG6+xMIK1WhJ4pf771Toakw7HSCrcJTpLGn8XLOrQpn3tDcMZmmXMFuSAjku2hqR+8PMyf83pOjsRQyMysuBa7xm8/RHCHRXQz7O0ANfDbeKN7JNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmDVb7Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2sYsZ8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmDVb7Bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2sYsZ8t"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAcBE4158148
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 15:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u253SUzgZpIEwxT0FxYMftNDXzO89HykRn97FBgneE8=; b=QmDVb7BhKrLHB+o4
	Cz5WHcLlAk9fc2bzSukd/88uzvcxxndoLrITDeJf1HEWZQvkEliL+gHBewl3Pf+c
	KvCrngAwQaPSICfImGSrksmjfzNdlu4n3PlfKv/DR8CDMTTfBkyP2hJ2E86ca4BE
	CeIeO9wUPIg7kA/LkS6dMEaaRuWhJm5q2tZ9RiAjGab69Q5AXwtibfiee74XwwGr
	HTogC87BnILx5SjZA/2sTuZ2Ep+fWAaZvASP8L5lB0q+2dtRYbODKl3xLE9fdQYW
	wHNVYi/fe5CVPGnz1WpX+N2tS7DY/Oq4NJaqKd6MwtRt4xDLWlk2KNUVscEbRJYY
	ATQrAg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdsqq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 15:36:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84842381150so3128120b3a.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449769; x=1789054569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u253SUzgZpIEwxT0FxYMftNDXzO89HykRn97FBgneE8=;
        b=C2sYsZ8tJdNqlPZVtlIU4PNkccbwtynNCsPPcrMJXDg3conKV4h7fmNQ1V1psp2ww0
         qbxNpRcfDKJzvPWNS28lTzYxs5nw1SmuwDJPKg6t+QuYKajCqlSN6mc1nz0A+iIdjR+M
         BUJ/5s8IPxJhzm1p4bY5O0OvB8d9jp2bPQwmlArBMvEjfx2HK8BdUhaxvzvT1BEeAYIt
         Tj7sDfp9dSv+2J0PDakdmxmYdeAmz0jttCpqpvm4O8o1/Uh46Jv19jmRfKQcmp43keTJ
         5OdujS8FINWbWNM0+JRRIDTNqjNKLbnlBRXrVp/VlNhcigldwjOIAjvT19f6WMzeuBDQ
         2B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449769; x=1789054569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u253SUzgZpIEwxT0FxYMftNDXzO89HykRn97FBgneE8=;
        b=X22louI2PHwoLy3c2yC9uDY3nIsderuyZ2y/zbjZk0baPN8mhZAH7v/f/eChPTQ922
         JQAi/EMNo9sxLNfK1yJWBqe/odLIZB4tzambHA8w0LNydN7x2JuWkeys4uDFQumRhRLk
         hn71wZ/sMRCIxfyEXaQenC8zFuwH9dWRdus0OBuB5u79rrx9bw7tyefycxpm0PtnVRMj
         j0xVPW2nLUGUh9o26id9jYSHlqp0/xjsF7jodeZ8mG4VCoseUZnO/oDqGmWZXiUNYDNy
         WYgIfVQZAyXHRmYgWYY3bKWiLQyOhTD/IkQ4esbVJV3OHLcxrIvqNuCkrrPvjiT1QMop
         NbYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8aPSMUr+ftqdVozYrj9qVQwo21o9U/qK8egZzV12dZfqG8vDtrsvkFrcy4lBU4vYNOPLqHrvJk74=@vger.kernel.org
X-Gm-Message-State: AFuF++kFBq/4gmyg3ETsxnqMB+px2pS+hhtidvbI87GhwzeaWQSTHvw+
	vzVPisD2WDYB859oJDAuaFQK/vgVOmRuTirGQICmN9znxQicdzzkyRMaGyEoab+olP4QEBSZfL8
	391Ysf0S2/GY4x2KsOq4VbVY3U9XfLvlsaFap1qS1M/ptYeXVAoilLsgM7CqDThY=
X-Gm-Gg: AYBFou10GkQNVRhUg2uVeiBjqYl0DfwBADQuzjTFtBNlripIwmxS7DpQPH6DF98x3GL
	FO1pfrxw3SU2Og9r3as5D/2nXwh5LUi7SS2PxKVmY3QMYEy0/vAnHFP+YFct6ygRzOnreM0cxzb
	i7zf16f1x50x9aEtVmu/7uhYK9hy+YAd7OV3PJMl23kHqG/XCRfLcv4lPZY3vZGBzXgk3gw0nHp
	E1E1VtESUg7EHPjBh7NWs2HkZ6CU7PsPCzuoceXur97FelGHiFTPBN+O8zs8YZ1S60AutuKu2Gn
	uawLh8yA694gDxJak7d2yvDZJvP98QxlkE7J9OgL6cAhXkqwyk7JS8J4i/iuGZsVR/Q/oDj2xn/
	hNwVByfA0S6hF/8v9sSmvF7dDNxbYVNRMGlP55wsDfze3uGeanowJzY54vDtyQQw=
X-Received: by 2002:a05:6a00:23cb:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-85ed26e5420mr17401915b3a.9.1788449769121;
        Thu, 03 Sep 2026 08:36:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:23cb:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-85ed26e5420mr17401830b3a.9.1788449768573;
        Thu, 03 Sep 2026 08:36:08 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f872269sm105836b3a.6.2026.09.03.08.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:36:06 -0700 (PDT)
Message-ID: <d9ca8f52-b00c-499a-b924-49ae4490b4dd@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:36:01 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
 <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfX+Db3E7p7AIeG
 dc5DNS9SOu9fOcLNoruUmmCtdUGpniZ6pOFZdvKzlE01NDzPxIr+081/cGTovntQOu4ErfCk+4H
 bQ3ZB5mguj/gbOiFOSxVrYNOujnEBEs=
X-Proofpoint-ORIG-GUID: dZ18hSRPWBOIUj-5PSp_0gVRDtgkKhcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfXx9GDdrmmn/4n
 WEpPlU9ZHvU4hOgt2QlKPNPgTAgwh6wPwlTgptDfMMRRMSj587jASfVeW2xRo/Ra5T6PNKJRRb+
 ryLcnfMr9k43Ta/DWDbDdwcxBEPWE+k72jukCWpW9m68XJGu/xuxFSzy+pd8cczop+inl81eivd
 mz5n0eLEHgrDT+ktthCcMooLJgOrjNnK7/VdPfK78TU2JOd3O6qiLA35XBrQUI8v4kXCjh47h2b
 bOKNa7+z2Kl4QKclzLwe+nnkNCc1j7mSYVQsyGKVROFImhTcKEuETrDk/VXI9jsQGXJaB1j77Or
 mOYk/DkuxvHWPFkxm8Q9IcSOFQlcrV6WrjEuomst6om4rq517SI9IxlbUXoCIRoFKPIYUL4Viff
 TS93mIO8MiBD5vaZiPm3FEtEwNTZQXyM11UfeEEzGFuRIRAkuupH1IwzZGW1ufJ+jQMZ5NKqO65
 iWzzollovQmqlLJwvaA==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9993eb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QVThMpbGrsNalZwocfEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: dZ18hSRPWBOIUj-5PSp_0gVRDtgkKhcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030135



On 9/3/2026 7:59 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> Some CMN PLL output clocks require a hardware gate in addition to a
>> fixed rate. The gate control bits reside in the register
>> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
>> new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
>> rate with enable/disable/is_enabled gate control through the shared
>> regmap for CMN_PLL_OUTPUT_RELATED_1.
> 
> [...]
> 
>> +static int clk_fixed_gate_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
>> +
>> +	return regmap_set_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
>> +			       BIT(gate_clk->enable_bit));
>> +}
>> +
>> +static void clk_fixed_gate_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
>> +
>> +	regmap_clear_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
>> +			  BIT(gate_clk->enable_bit));
>> +}
>> +
>> +static int clk_fixed_gate_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
>> +
>> +	return regmap_test_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
>> +				BIT(gate_clk->enable_bit));
>> +}
> 
> This is also all just clk_regmap / clk_branch
> 
> Konrad

OK. I will use the existing clk_regmap/clk_branch infrastructure for
these gated outputs.

