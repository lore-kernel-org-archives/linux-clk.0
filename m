Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320702F25EF
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769618898; cv=none; b=Bzt2dDZqNTeGdbjQnCezmpAoa4TVfh8WFV2gww5kBYT9erLloAduK7DPIssJFE2HIjMJiuMFcajvK3KVGEYOzgJi9nM/ip3PtQz0MxbIp9FzKa4nJY5s2KmGisSmKQkNv3Zc6i6SN7im2ya2iqLQ3VYEcohtYsPAXREr3e0PZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769618898; c=relaxed/simple;
	bh=qw4akz2uLkHjv+QOKpF57MAWUCmlnOsR1fRNQTMX11U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gMY3B83XNdD2rsn6ZEfKxoM4YDLY6kKij2Q1aRULihhpVbkretlMeO1cmxNultE6hz7Jc+oJHKXfV8bSMAopVwvxDuT47oeXuTHNIhYZ9TXgrtR8O5XhDJTD+luEHgRZewuIs6saMQwEpQMxyPHVtAUOsasOlWILKuoXaow+ooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfBQTrRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHdNVxki; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfBQTrRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHdNVxki"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFmiaX320202
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 16:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=; b=VfBQTrRR71tT+QHJ
	ADITeT4Na/MRQ8jGTYFyk4wBz4qhQ1uPjOWFNfuIJc+1zybZ+LyxuA48b+LrayNg
	yfQFONJ/jTZYe86TeY938lhvW2Y9U2nZpGjDfQR9o0H6RH7kAG2neQUvm2GNDAot
	SRNYFTQXyn0iIoEFb1YcoGGqaDd+TEYtB1SDUU3O1JJAdMuw4EBfCatAoJJJNAiu
	k11tpG7lxBefCu0O6LqVvX9OTGh5a/zTr0pr22XajasEo3zJ5kBcjFKFIFxnRIdL
	3lljt1fadot5asEnnhqIODc8Z3n8oLDaRXNjozgNsCG5aNLs/y4hji4SxiSs9oDi
	j0OWxg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjuqus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 16:48:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso13615063a91.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769618895; x=1770223695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=;
        b=CHdNVxkiPpA06ywrKpfPg8nfrA8dOkVGukE1hEX6PtC6mGmQE6d4zFN9oS9JLcg2iw
         ftQPaGDIYEcym0lwhbhZikMci8y8ETHQ4UyfhgEp9HtS1HS5utw6OGBA5qDDwULAkteZ
         TbkEtIYGGNbJOosb6t5pJr7wb1TzWCc5ciGzsCjDnNTGI2sT/buBFllfOdDm+VlVabbh
         xTeRSAWfqFQsn2ujlpuswCvWZvx4UQ0zM9Khg9WfBwGopBohDWREogLy9INb91mtJSq6
         ltRLU2r0ZyBwp+6P89yzsEyqVtUI7kxYPADvWTGc7lijYIICR7uRQl/gu9Ngxuotrlkz
         yK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769618895; x=1770223695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=;
        b=wgbbI17hzWXkk0wekcVckF5kXMmUTuWK/EnyFW/cmrj9UrONUkGrFCQ5aoT9DoOgvF
         Qmr6clAlyfxbOikmRSEjFftGLjeY/SP/eyTM5FsLAPI28byuXzrIcMI8DgbLN9cZAr6D
         rGJoyiQNXwmLxYMCSZwWY9SC/tnVyIBMuKBj+8HOIiKgVxv3cMNKSqpzPOoVx31uh6ca
         XO+6gkshtnder0E/dx6eONr3fuWsbTCLtKny1PrXahRa9WLdSs3xjXBzq+1nN2NPPlKb
         JL8WpOetNMNuWBKtXhKPAdszK9o1PiHYBTijUjtx7EamAP7ndMpcGiXK4DmJ1uaJVhrH
         +2iw==
X-Forwarded-Encrypted: i=1; AJvYcCXYVjROwPkpALkwWXF5c/fKn7VoaNEk5ty6LaoPZf7QhhfN655OCp7hA3whQMzQSCZvVzuSoh5LOD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGQ2QM1tWTmnsT8VpnsIVzAqkG/DreQVUEaH+97l4joTA8p5JJ
	FA2gSs64+W9ZrtR/12yhutEmX5M5Y3Y9WbPP+5AnVkxBVVXfDkKTPuV7eWw1oGmjpnRXwYkMwhl
	1B/kJJQsvmrMZaIBBaZp4/hdxf6hVu+0puaurAxVs9KxRvEY2akgWp8uAxsW4mtY=
X-Gm-Gg: AZuq6aKkJjkYIDchxquxqS8hnaTnlMYwKVjcyNhrIAqUwVFGyFud/uhmZBa81nqg8+V
	o5r6t6y8UXuoBqrh6IDrGjxDpgHh2nEpmx5qpzSZy6fHxPQAqHgjYoyTl5CWoW5DtkU+5WlDBV4
	kF8ohAhp1G0wafj9XlymNxKYyOn0e1A/QS60X+zYwOYY1c6WubQ9VItMjvZ8nTlfmkSydLVhX0E
	Ob+jDIbOyMzqd0DHcEh12b5cLgvoSk+MyM6rV/2teHPxE9zMrQ/va6JNGw44u0mkhnZ4nZvQsjI
	M4ppa66SGX2E/sFqU0oQC/jssfRAtVVwa6CyxOGyoiX44FeeMxipN93p6j+1z2/9RgD8AJsn1ah
	9MSpAWp6LuXUS04Hy5020Fm/zQ7fVJPQx9IzRzw==
X-Received: by 2002:a17:90b:50c8:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-353fed94929mr5548594a91.37.1769618895106;
        Wed, 28 Jan 2026 08:48:15 -0800 (PST)
X-Received: by 2002:a17:90b:50c8:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-353fed94929mr5548575a91.37.1769618894628;
        Wed, 28 Jan 2026 08:48:14 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc7c6sm2995577a91.10.2026.01.28.08.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:48:14 -0800 (PST)
Message-ID: <7d1fe730-1858-4250-93b3-81108fc4a0ff@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 22:18:06 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750
 camcc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzOCBTYWx0ZWRfX0AaPN2ZCeisu
 VM/KrnDUCoIb5LyaNvBMIZcnhw6m5adhbvoAPgxioAvTA6FtIJO19mKYTn4843wzk7L4YLCcYW5
 jrqbk77LozAE0OT4DMKA/AV4jl3y/sPhpJ6aGTAvqjW2gwZgDXbI7ZIIWZ5heDLWSbxVxYvo2fA
 aTkR6dQxaSAWWu/312WUkiKg9qrbiascQAKCtRjEPBloqSaORzCrVjzSfYYU0W2fSjVJTv2326D
 NYEd9X7XnA5Ku43Ih2LI8eab90VUQj6cR5r+RPmwpNUEfjj3gdVgcRb4k9Dct31aykITXm24gXo
 HE49CMqcEiiEJJ6kbgdwh0MZdr1eDJCiPN9CRNb8lnuAk7VW/LalqtWtyTq1WkEGTv96eVMKB3F
 WB4orNsuUkirC1pZ0/onx3wl66wFZuEpXKecizhUXDWpBnVrMEGFpGp1hujRl5Cq+28rZKvoZHH
 SRcFaaydCUiE3IXZv/g==
X-Proofpoint-ORIG-GUID: 5NldNc3h4Ilzy5Ws9EuJuXV8dYs1dhvR
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=697a3dd0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=HFDkwTpxXVET2aFY52jhbw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 5NldNc3h4Ilzy5Ws9EuJuXV8dYs1dhvR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280138


On 1/28/2026 9:13 PM, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
>  drivers/clk/qcom/camcc-sm8750.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

