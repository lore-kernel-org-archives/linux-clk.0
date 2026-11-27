Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788727;
	b=Do50Qx3AT7mgpcAhnn16Td88kDqWwHP0bb+0u5epJ2aoN2hNGKxOy6m8Z9Is0wLd52yi
	 66BjowQtFx2yawkvFJCBbc+H2Us2I6AUrhPN9Ju6ltvRDco1B/8dRQ3aVoI4CT4tseN0s
	 PMy/S2S3PVo5LtqjKX/eHkLmwdkmfAknHfHp8IBaZMTa8vjDsrdlWF1p3/OLEHMga5wSD
	 wWqQ+OmGyiUmkW/E/p4Chgi/l8+nB1ZyT+Yvimn8i9OoJkO5pwLDj9ZvPxxt+WAYJNWhp
	 2jmE6Q25mvc8iJRV9mSMu1uldSMSxM4lU7RUOVub84PSOWvHUEqrzTfuSqIMg4zX68A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
	b=CMR4i7FPviAOzUMZYuUkKokgbZclUEsvqjCGpYSqsf5gasBo8Qr2yrWC/L9Jdj9P/PQC
	 EuS1782bJa2lAH7IkjJ0dXRJCYIRxepritmkU8bJlcS9+44MwvTWI4Q7mcMdLpvS+VE3V
	 Anj1bIffjnE1FDTdY2D7aIAo82VUrDsdke54OSSrK+yPOmtsoRCU01lcd/6nyvymD/INU
	 JKVFhq2B2XwtqxxLFGRUZA9OKGNzHdh6nocVELjvH4z2fkwBajf5iQu7BPhDwYxzTLxba
	 PkMzwD23sdYflw1ROxagn4bLkJssE8TXXRbIFaANkzW1yOz59T7SxSWpAPnJSxGKy+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJYtd2Ef;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FWKwwD/j";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A0D606A31F
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 14:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A0D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJYtd2Ef;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWKwwD/j
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1C2A3320293
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 14:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=; b=jJYtd2Efx/TMqsM/
	44YSUe2TAlE+lM0Wn/MRJadaQkVGJ+rCu1ZE53uNPIoH+BBmGkD9we6/3bkQGY02
	Ctdy4SgJnz12dXnszVZivl6NdAlRlGLdpbojCZesdncurHhDyjEBfQqG4N0bEXO6
	r8Cj3x9P3ACmzlxMGzYFMMQlamzutk7AQ27zHzOPv6PZXBi0Id5uXmA4FZxuCQ+k
	YSNxKU2MWhXBQsilKx1mMPkeWdcFtT6tF7YdTZlYD4kuFPeffD7nnHcGp4O5zbGE
	Zsjir5L2bvslUuQxwS43fBMfnBsSKQNJ9jE73wSa1NJts5wRLmmAAtOR160Exvii
	R655Pw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93v68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 14:12:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495f7e03b9so79150885a.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 06:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795788725; x=1796393525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
        b=FWKwwD/jJK969UN4Fo2CRCh1Q2YKYwoS7oF+Oa3OIt415/YNTQ3PvNwIaLGdqkyhwl
         UjowUc9iBOvfi18rRzxT/27aie2QSwZGLgJ17NuRwMdIzSJVu39XS2rql82Cu1a6GRh7
         WD8WNHsT1uYyc24DYYGZ2C4YVQu+9gkutY5VSaQgu16T/n5fGp3/Fry+L5xm0zMrfuaK
         IZ8aQNSWG63jQn8/9n42KXm++VzfbYeTGSWhdAoNXpqazGWxtMw67ofq/isTEROZBVNc
         ++1FTN6TRkdFVLhkR4UdEkjBXFzJGCirOlAkGIFeUqcJsNmz5YHB51RG/hCIXTKpvqVF
         eTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788725; x=1796393525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
        b=LqZ831JTzP9+LbirGYfDvPmFT4GqQVSV8cTPpicrXBbbRvvdB3tsev2HWgIUfI2tRO
         /NbNHQNn/K+N2cyaRS10pKKBHII6YzZlI1t9/HEFaUXJLx9sspd9gnhaiUHbfpkBXtPF
         od244byZAQdYYXaYpVZ8DoTwQBXNCw6qpBw7fDeGFP2TvJkHTXv7hHvIE2Z19jO24YPL
         NKVXPdMKJ1WzFCeYut//PW1gCvfiRDvs0/Hi/HHME1vMj/T5yenAC5Dx0RLKZH4Lc4Aq
         oc+xELihAunrIDgBAEbzjwtu0ErUz1Fo6n9vuXvFV1QL8I3RxklttdtkT64wWzmyciub
         IGgA==
X-Forwarded-Encrypted: i=1; AL+hErFYJX3P0kpCzBJZpWICksho+Y9y4LvLhOShfioX+KkzQvp+jMHcbrkQ2i5OHE1LkkbNpnVN7+jOzDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ti0RoiqiEJWYL1G45RHvvcOjPxtAz8pEVQgjmB2WAxZqQf/Ke
	jLr7HJ5hLnn7UDTMKgrGviIhyapKmlJLmJSBdlf1hrr85h7X2slJMYBJ0tmz8XD3zvPtZgQiWPq
	bIb+0qJkDEWo4yl17cbqj7MXDPJpTHiE70annBQkEObLmWsxFFRLI3jJgtw+sBvI=
X-Gm-Gg: AZFdTZf9eXNw0rNqanQtMKOb9AIqbIozhMaxqA+pTUDnk6ZEWK2/VAhiexBRyh6BE+5
	jRm2YOByhbmb4e10/gZt77NCelYN/KmPEGMk1VuC3hqA7P8Gi5J2iq//3prNgyQXkixqf+Fql9t
	cTcPa6dQY0LX8q+0RnsMRMDUQ63hpgehsBCtx5ikwOd18AKxoYa0hH/nYLDtA7suMitePEkKAdr
	jjykkPXRZPYtXnYkavaQL2zcBHYUo6SYs1SSsT9dQJ8w3P2Bd+gtmnN8ysWeXiVXLnt8JmKeHhl
	6W3+xH6zQtFQnVZviJt197g2Z8YL0vuIY9RVTOZF0Tlmx10GB5sSz6gyYoExNtf+ppJEroaUhWR
	zjM2onzG+W7RPugzsUD5zWLRR9pOvo9UnPU4oMy1O8Nx1i0Oq2xpkziNn
X-Received: by 2002:a05:6214:4a02:b0:921:38fb:3be7 with SMTP id 6a1803df08f44-92138fb3e07mr529506576d6.2.1795788725011;
        Fri, 27 Nov 2026 06:12:05 -0800 (PST)
X-Received: by 2002:a05:6214:4a02:b0:921:38fb:3be7 with SMTP id 6a1803df08f44-92138fb3e07mr529506076d6.2.1795788724547;
        Fri, 27 Nov 2026 06:12:04 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80572914sm58914361fa.39.2026.11.27.06.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:12:03 -0800 (PST)
Message-ID: <03c360ec-fb3d-4bba-8c39-2dd476f87925@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:12:01 +0100
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
Subject: Re: [PATCH v2 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zjOyRWls497ELqkqyrSvmYqKKbWNuIdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX0bfRKt38eCZH
 EIqq09ZMQmAj9KFv3et8ykFlmF+pPqI2RuSpR5lc8AmlIf5/aiGNUpV/v+cywqo0BdaMzcuSkA8
 BsSQHNAD6GMSgsqy6AVLaKfn8Ny+VfC2oo+DkHSYmv1sfcXvzAVP7538kT8+t8zdXf5qg4n46W2
 slomJ3IV0MPoQ1eKm4Bu+pHHo+1D4A+DoJ+Utde8aLbNSvsPcEmaaghZn9Fmu2S0yVAEOfWiErL
 lQe+OoSfSGPIPWSuXA1TCJnQ0UeYJ3B2bGk2VTc8dgTVydvagxqJiPVZVExyoBq4YB/wq45H6mR
 qEwsMKUF46zBX+K05Md5deXUNQ0sTUflWq9DboSKJtZ5DPBFuchENsP2lNu6rV4UPLvj7aed8TA
 9LDUNhf08eFJ9ed39OKdeB0isT46lMZnIx50s4k24QqTns9zMsOF8NcxpIwN7kEdog2M/n0FeeP
 P449gYlucWg1QiDDasQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b098fb6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bJUmpo4LbrwfO9ae5mQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX7Dm1S1kUc2GI
 +ocgHm7RZZT5Wt5wHhjVErWsbygQN9cS4mH0Oyn+wHRyCs8lT0Zl8XQeq1cAUeZco9ahAk/4zDO
 7FepgpeZHbZPd3PWc9oiHwFcJOoKIgo=
X-Proofpoint-GUID: zjOyRWls497ELqkqyrSvmYqKKbWNuIdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On 11/16/26 10:24 PM, Stanislav Aleksandrov wrote:
> Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
> downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
> IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
> As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
> so these are LN_BB_CLK2-4.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
