Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D4D3845D9
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380705; cv=none; b=laUiSQ9FeIHv4HAnNR/r9EnUB8E5AV56P2d8PyX7vU4o4JFZ0SIcIGdpX3JhVMZnUBNMFntiAQgf3FYzaud62ieBtRWHL4nWG4Kh7/8JbERo/qzv2JssN7zT5ro/ouA4HV9fel4hIsvDb1S93CX7DBAINHcRYOpW9y8Qd9Q128Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380705; c=relaxed/simple;
	bh=F5nM3FlwZYDKnOGWPYZGOXg2YqjwjAbihstfJXm3/W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuHydZs1jD3VMjX3mAubdyF4IgtXDeaag15kGQWtjZTQ33ppFKjfeaK/PkAodaUlNsHVTYh37+UDw2g0t+pFhI97MsnsY44/eTOmNReJH+LNAxnxwxC6RbL+ShOSBWsb2jgy4PfNSz7T/nCGq6Nh988XYJ3Tv+hY1/eE9UYJ4us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZH/8Masl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hP//T+HQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZH/8Masl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hP//T+HQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p4fZ2951448
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 09:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ivuYEVZhvcJXkA99iMNtvpv02WP3n58ss4Dmi+Ix2bQ=; b=ZH/8MaslC3JP5Ps4
	GuYvxyoxNIJUqyxvdXkzb3hB4lsc2GVM06HMlBNEuIFonVF2+PioGCqy19D3lM6C
	oeHfRvtVncB9/qo+C/9+uAJjmzrE2jdtD4Mm5SOnpjWVqtaebqZf6HMvmQakTFT0
	BtXA73iume9KSv3k4m994Vay/ifM9EmTYxhMXfHcEZkgm9TiGp5d6fMaPufnKCeM
	4a6FOCG5SAel0oIlsduC1SlkM4LS9fU7YG+pesl5jfdIgFKTThaP/15M301Nq8pK
	V1cEF+onK59DUUaE6u5xjP2CPdJy6rsZs5Vp4994UcZVOgl6qEEfhsBRjV8ltZEH
	nuiUUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynrhc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 09:45:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92585d4237dso22741585a.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782380703; x=1782985503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivuYEVZhvcJXkA99iMNtvpv02WP3n58ss4Dmi+Ix2bQ=;
        b=hP//T+HQXbke1e1TuANssL9BsGcFCS6fk5oqiuJsIMkxaUG+eNp7IZ6HadSxRtNBr5
         ydkL1yMwrnM+H8m8APFGDVF5c2ESaSkdHXIZpuDNdZU4IKd00WbiNlAyXu1+SAfJjFvi
         YS0lUpVI6b50Z3xOX5s6D1+ei+VaKcPiCp8NApZ/vfYxITeRTBL68fpTHrOdMD84ibED
         csmoVVW5jFpKK1uwFU8pIjgwXlPlII8yGr0QmdQx+86tldAodTt5JSKSS5c5582N7TDx
         g6v10M+SeNdqMncgitaI6qN8ps4dnFuAnwbk8vuVBm9NHNt1nSzyCaCWHEs1Faaag9Qv
         QoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380703; x=1782985503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivuYEVZhvcJXkA99iMNtvpv02WP3n58ss4Dmi+Ix2bQ=;
        b=T305/pNCXqxZodECUT6G9q3iypkJlyUH+If0Oele3eeImSacHQ/MOAT2a02TquEUN6
         MPwuEcvTbKi/ituGvzyEUqJCvcQp4HRXoFTRpPIRrYfA+v+rjY6RtYKvZF7VHafHik3Q
         9R6pvaLQ3+UXnUosUApoworc3xq7OvQ5006/oN1abKqDcqD1E8+XEUxJVuV/8eY5FYvl
         P2XqMhuawp86S7z5jKUePy9qkFbmcUcH1WA19k/2igGE0RTqhj8f+OQ0JhcPn8eT7/l+
         LmICZQqIRPQ0d5dfU7+eQFeQi94BvhvReIIJQ3ReFVeIlCvqfGUqQrH2WL5CPcjsfDc5
         +TFQ==
X-Gm-Message-State: AOJu0YwNrHsC1QHOulSs96XKM23Mczg69Y14I3W3hH52b0PdynMFVvkJ
	N1IQ+HorUUcvFAHA7YPMZwLaGanS6hqAXnmb0eIyb9SFSqWLvyE+CBKhbutI2mZgs+x48b0DrQn
	LCF2gogUNTpDhjNX1VOkPOfVZfQLiPIAUdYUHnmb5HugzDDecYDJHjvw234LcBWw=
X-Gm-Gg: AfdE7cnsy7Vm0jD4vf5wFLghx/7awn8HrhfMAFUMnmT8YuoXcPilVpYTqsAjX8zGBa0
	g2yFfCuSBMqfcAAD/MzixNBSldo7iGezNbhaBp0blIVwRlB/zfquzufTZRfSXfWGd+Dpt6M1noU
	fx88EoN8gG2ZbGkysJl42C/EmzyXzaax12cLZa+DhorXIEQZ5EFQY9zu3v/CPnE4ObjQNYaXdgI
	2+kHVkc/mN+xVJVq7X4t4451x5Yxlr/yEyp7qgIqQEblHl0klqNq57MjmgAnGBDBm4KhysKZnlI
	+r/X2KjXFitethXu+ZyjhEg4AWTK4JOeSGfW0ELK3GV2avucLFjWb+9putuAokWOfYxdv8wsGWy
	239NTBu8+ZUeKpMpknL5+FF4ySQwJrH7U2lA=
X-Received: by 2002:a05:620a:444f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-9293cae6ff4mr142421285a.6.1782380702526;
        Thu, 25 Jun 2026 02:45:02 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-9293cae6ff4mr142417385a.6.1782380701715;
        Thu, 25 Jun 2026 02:45:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbec0d83sm140298166b.55.2026.06.25.02.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:45:01 -0700 (PDT)
Message-ID: <6d8ee022-770c-4125-b1d8-b8a020bf63ac@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:44:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-3-15f82c64d95c@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-clk-sync-state-v2-3-15f82c64d95c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfXzmptwqTqfsBa
 jlE9p+bgjnCUUdXnckH089RFiaJxoYBFAhWtghaZUEXZRe/FDDbZzDYNxjRwNtyxCQH2zzmDuLf
 5ZcuHrV6HIDim0VB3gbWCjgYtLSCscxA67Zw004UlIVlD1nQIHNFKA/t9cHvxaPZxmh+oTPWOWl
 t6k1gwZ8uwhWr1+ciidwojp0eBuvIchVdy14w/CdyxDaYjCfIbP/TOheuUekHy7jQOHHKlnQsJH
 g4uF3Ws0Qy50OuJ1mnAaMmxMAXRTF0yPLg2DCRO56tvC5hp9lhv8ls4H86XKiDldzsSTB0ct+JD
 w5ISwd4J0OrVbPxwBS5pMHll7cu0kjadeN6/I1/KdSfowqIc07VNlRlBH2IsbTh0b9K21cnHIo3
 nAIgwldWAv9gFNF+SbPBYChbqxyxyHESvwHkY6J3MgiqQY3920NCmC74yixNE7pf8b43pylL1E4
 zBKeKPkV5k+042VXjYw==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3cf89f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gxl3bz0cAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=cO_c6q5x4vnfYnsnJKQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: J70ZvhgenI2MsgicQTi4YoTN-QC9DgK8
X-Proofpoint-GUID: J70ZvhgenI2MsgicQTi4YoTN-QC9DgK8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfX3HKN2wMNN19P
 k9PK2K1/t8R9wxv7k7wSI1rpA47VstPbsKrIf7NWhKGomgsWmG8hWiFcZsw9qubKImtIKd71kBa
 EzEeT/VfzGprBN2SjRz35ElXAFzfYqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250083

On 6/16/26 11:09 PM, Brian Masney wrote:
> Convert all of the qcom clk drivers that use qcom_cc_*() from
> icc_sync_state() to qcom_cc_sync_state().
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
