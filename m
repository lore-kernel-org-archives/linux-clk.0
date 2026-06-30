Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE63F44D4
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816082; cv=none; b=G3/tuAFMRl4+Zo0951Gr/MgXWsu+RnIEDoHnahMZM5NXStRYtL7qcWjntjuGnl2YCDFYNCXNEk2nWIbbvbwYnmNhfAuiPtsV3M7oC0a+2KuZhMtvM0+6B5ovBXoQIGmai4M4Oxy0Xmj/uvBYYvrXcs4LUj2BW+tue7QgPUArIYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816082; c=relaxed/simple;
	bh=2HI/rNUcbLbGa1cz9v9NI7RSNwM41bGzyO/JBQ1dipA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IY+ALu1k2TbsAcZ893afBLDhtgas9PT+wRxPs2TuYF7tzGGy2ihxFa+4IR93qT2gxTjyLyVOGsdziGcEVNL97ZlZvFe9hA1++AcF5ZOJLLmpMa3CTIcCv5f+/xv+wdWFj4tGOYACouJBCBg9olegIzAMqaFjYBcQeTxI57jYn00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4dvGxdK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXXlpJir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4dvGxdK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXXlpJir"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnHl1541498
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXsyXCX9guvSDj+MZYuaEMLKaY9BIJtmQB2DNEPy7qE=; b=g4dvGxdKCUDuwRyf
	d68fFXMSNDH4zUdnL4R6KKtpIAizTw9J9jrOVoqI27rbRuZFLYJ6eM0ko82fcM4U
	X/CQzh6xWAapvX4xKM0c4tI/YQW+l030/MDU5JQIAI2JqwCdfvdYkCUagSpHCVLG
	nwsnhSh1tPn5PBa6udbLI2QmYBhmRgBxbzgTr9pB8OyLTlGQHvFAzXjF6ydx5uR8
	77PukMECJKJKRP+Xp7D2/cQT6Rj9IlV7WT/JrRdnqSsuTY15FHe79VoHYVeiLaUY
	IGY1OAYpan9a7E7LqPRzD3XLZtYFDsfNGF0EuNkuIsmaBhXi1S5nbT3Zpq70z851
	NcqfTQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp1y57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:41:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdcef50495so955e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782816078; x=1783420878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXsyXCX9guvSDj+MZYuaEMLKaY9BIJtmQB2DNEPy7qE=;
        b=IXXlpJirrpbjJDcMwMajUfiQwDapDcQYsNQTsEiveBK3Id97e1GLaODbnesA2H8hsM
         67nQc6MLkgvfCBeMeZpMboyyolsVge/joVi56aJZPDAkFx7oE+fIMT5LUvAGbMBjaR/D
         0dEAeIno/tqb0Eayc7a6HdPrVumdhWCLlcYOseZqHsjqAY42xaiH9cqkg+nqhhIxpeAq
         nxC3kR+4CwfbN3xXgLzOvlOm/qGupgrFrceMX/ATJnGEqHL/endPqJ8yxFlp8NrJDkG/
         OTWLPSbn48ZJ2CeSODJkV0wc8kaijk4dnZIIPJYhJaWwfbrNoQRRo2cnXf7TDzhPTBLK
         JMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816078; x=1783420878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXsyXCX9guvSDj+MZYuaEMLKaY9BIJtmQB2DNEPy7qE=;
        b=eoxCw0nkRau9QAcmodUffSaEyKoar1C9FIb3n3/1+g3npzkwcaV51WTx2x28lbEDbk
         Bj6klUlgkmaNguIat+FgKBjAet6lNXt9bU+zGvWFSjQpZ5KcPeklYuxsobNgyu98NoS5
         xNpPi4VxIS/MQPQ8NkYdpFA3swwHZXQYTVGRphstEkXj2nX3rJw+6DQMMQT76T6ogJP6
         6ChVBYg9+v8rAFgiStNzaGleH6Cb0lOBUdhri5JMyn7nOZaFIPEGFTChMwNZeuA192RF
         DcaTdUOZ8l5UoRd/cBlBuheuPkt86WL3+t1xn0cgdSyzDt6VMLdgl1Wfna4KHXPLPOUf
         TycQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOdsqDqYvIHYI94iTLO6R1PNj98gD3mmLGBzSBXVCdYbmEzhSU0s8BwUhbPi+X4ruE8MMs7E1BU5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX+eHcWoRsc627VIXj4Udw2yU1nw7eEZr+vu+qtG9Y1uS7bbBx
	SKPkPRfF18BMDn4lokzEC1Kv09PfI0o+a4kNCb8jlIUqVGzxO7zILdvvWZRILf3Ezo20kUhsf8H
	xIO1Sa5zmOfEkATVi/4h5WJtM/WjRYPhRwJC4eHUTKbsZLMiKu4u08y5ZQLU3LoU=
X-Gm-Gg: AfdE7ckZdXhZGn9O8SKzF2vo9yz3j11dfCeq40S7MsxSsw56I0T2fRWab8s7/0rLQkz
	4VLVSrMyE20MGnx6fJMrT4XJr97xhKc5RiIWnu4/9J0Eddwc/lx9O8xERD8H19QjtazxmzQUk9A
	1nVnHDdGQnptf9+TypUmvcneXRSWdNOR0NtQBLMDkdS7FhdPA0CErtXIO+5taVHW/8WA9Eglxyf
	HTSTPB4yo6lX0+oXYXFtwFjdAqMlWI5813kfzSLWDqfJSD9UurDvSyHKFlLy+v9/GSRbQNbDT2t
	5V0UPTrOAk2Wb8jHYuuxqV2+VIdRK5sAr00zoOBpngaVXrFKgMUj/johvtwzBO6zNOQup1ulamG
	y7csJSkF9WEU4vhwL4RUXGSzFGhDXxG26unY=
X-Received: by 2002:a05:6122:7cf:b0:5bd:93a2:ae3e with SMTP id 71dfb90a1353d-5bdbedf647dmr506838e0c.3.1782816078111;
        Tue, 30 Jun 2026 03:41:18 -0700 (PDT)
X-Received: by 2002:a05:6122:7cf:b0:5bd:93a2:ae3e with SMTP id 71dfb90a1353d-5bdbedf647dmr506832e0c.3.1782816077747;
        Tue, 30 Jun 2026 03:41:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c950732sm936531a12.22.2026.06.30.03.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:41:16 -0700 (PDT)
Message-ID: <13f7c11a-a1bd-4aa8-a0fd-400abb0d9ff8@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-qcs8300: Use retention for PCIe power
 domains
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
 <20260629-monza-suspend-v1-1-b601d8a2f2f8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-monza-suspend-v1-1-b601d8a2f2f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RBOrKOEtVCPCPXnTCrVUUCU10dqsHdQU
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a439d4f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=p4vfNC9F68at6qyTyrMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: RBOrKOEtVCPCPXnTCrVUUCU10dqsHdQU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfXwlAibGuPXwif
 ZO13MsGvyPVMMC97WcQVEVLL3PaZJ5Omj614NZtfvf7BmKg8Xphw2B9jxQf3GtPCWe9WyOXDDO2
 pwRywJ0r6qqiTTr+HvOvaWr4oOR5j/m6xZO18SsovCPhf03OesWPajZavixgNDdSu7TDNFTfcT+
 f1fxlwEL7ZSv+KjEK5tnPjrIs8naFlqnLfwZXVOb4WksJJ/F2oOy1mnNB1gfKKfWnp0DdyPFEp/
 ZUhHQgOufwQqr2rmreoozLM9RUHIsRYCARSzJxYXMUcEv4jmAm9Xzb0G7QtWmqEC1K+dh/7swAB
 wR8SmMkSjV8AYpR6c+9NHiwpUmcjoGG8F7C/PsoBP57HodF++3/OkJvYLmNxsX055+h0qMS3VQQ
 clCtTxtxx3V8way4d7lR23fNQ1GPMszU398ZcIhEnDZysoTJEIJcbLeeFGjPkKNtYPFWUIKJ3CY
 VBGCvyF9NpwsutmjJ7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfX3qRWNZIg7lYG
 NEYLyb+74igfLuGgg8vPXhVcdI/rdKO/eF5FC9lctgdXK0sPdM3ty7l9VeHQBwECKBZnU5DNw4X
 PpLf1zOflP7YyDPDN7ragQbte+uOdLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300096

On 6/29/26 9:22 PM, Loic Poulain wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, use retention for relevant GDSCs.
> 
> Fix the PCIe link not surviving upon resume, and GDSC error:
>   gcc_pcie_0_gdsc status stuck at 'off'
> 
> Fixes: 95eeb2ffce73 ("clk: qcom: Add support for Global Clock Controller on QCS8300")

"fixes" is stretching it a bit, given the problem lies elsewhere,
but okay..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
