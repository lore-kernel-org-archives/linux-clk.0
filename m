Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AB03AEF5A
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826327; cv=none; b=jUp8etos/voqutD9hsGDNj9EgPYViytP4alzKYkFFLEFzIprJNlUAJksoyx/VHKseq0bO3/tftvI93co7IIQErZOlFlqomFAMyvnRgBGGCiOzgVZA8Br+xcPzq3pb+5u7yQbzIXJsICwJxquvjXhdDPSXw0UZolCF1lIVZE9xBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826327; c=relaxed/simple;
	bh=m7sKiZPj3SO+ZMld7la5ZQCKUA11O2/+oIVQrdIJ5A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jISsTSh8ZppsOo8mCqch7I71zWn/sYLKSvpPLkpX1czgNqTGTQZqtahASgFBiENCgH2+WLaHVx7USepaDGwefcOYcU41hnYb3VHCzW9eWEuHmyKYgbUZ1L9QfuiS0txjuCvdJMK814OVwee1Dh8jkt8jmKz2HxTegG0EBsoMIrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krDJyi/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyjsCvzG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="krDJyi/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyjsCvzG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8mtUH084761
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rU9r6GK2AYbjb46aZ6kaVHJJ8hcMQ9WFGGRTQl1vss=; b=krDJyi/pzQ0hkcB8
	Xe5KKZ9AX23pA3mGzmJK8ZX9JmMROwRKr3ppOsDC+ZgPMqxmz3tKzpM4bzZcgxap
	LNfk5MLnfDWdpFzm1iRHOTBBNNrH+TnZV9uuyMcfjTbIDe3MNfZykYKt6inFW2dx
	SUOx/nZq7aDNezHznyx/D63PQXVHOfI3fC/KyWtpPO/7ehac5oZ9+LeVEsWr7XO7
	sFV05JXZWq8hJqb35AzjzdkCAZxovvrNB8Jai59n+svunv2BZJOYdLDrwUGQNRgt
	z9gsTzuI4r0ZET7QPscT/AhF8X44A6NCShTByiqZRzQ5CF/z3Kjgw3g4Zo1MnOa6
	3lJd3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqesm75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:32:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a2c535eso364277285a.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773826322; x=1774431122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rU9r6GK2AYbjb46aZ6kaVHJJ8hcMQ9WFGGRTQl1vss=;
        b=LyjsCvzGdUKsecyPK8zJ4955So1A2TyKn9MaRZgSQEnspb0Y1UnrqLVYRi3uRgGX2Y
         E6RJD3l8BKlwyioTGjEhRAwA9Vvf/FdWoKc1pIs7z99qFHKzKQa9gXt9SmTvGINQx5S0
         oYPOmmeUyCUYaJ3sYp/tlQUQDSThxQoaHmDZmg36FTlZkdeXJA1IV52FKQ+Y0BEabOw/
         kgLLFLLIBClvxoT3+n3VNDCh03NeHcj/XhXlnALbZGELeePIB/BweqJS0vOEkaEVUUsN
         FSm5U6JNhqRKgrmbMidxUpdDAWroSSsMzJ38a2LVJqMhDEBXfNFhmsTcY5jektkBuHXm
         cP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826322; x=1774431122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rU9r6GK2AYbjb46aZ6kaVHJJ8hcMQ9WFGGRTQl1vss=;
        b=gLWQSzbmOQLuk5QpE7WIVe8RcUM89OUCzuVaTwTR7xsyjPWyD6ah507S8vkaz1h3GB
         JWqs//hyCkAcSZiuAYBcMAEo9i9WWxT0bCZ+BkrWsTL7fwbtR7Yi8/7jFsbZRBN3y1ag
         r3YTCwxpiP9tPfonlQjc0XigB+Lzv+mQZgvvxWwZPPFgRStjV4pyV9xk93CGYocD5CqF
         eDOjvYHYMVrbrfuj/uwNXVJQ/BuE3/Iv6sEUNDoLMI/HTkGFcziWJ2UKpqHka5aSFpBA
         i7wtAPxS5D+ryzdrtdAroJ9PjLWeo+1IHJNvGUnQs0s0ZCfOXWoe8zxSyeexl7QfqTUO
         Y8EA==
X-Forwarded-Encrypted: i=1; AJvYcCXWz0Crje2hDbFAZ7oY+An/txHuuAj0KSRrG48GGGvB1hz11EmKC9tpH5Epktuziee6UPUxFBBtAWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvDtIzRSjL196krjmQsavXwVZqMFwLXUNt2lczI5SP28NnsfWk
	t4/RRv2fbDzi8qw26PJ2IsQ5iLalhvURoPYlgWBezmPQZaZcRWmcFQ8+PgD14YXDr313N0W8rns
	Z0Lv7M6GvIsAVQ9OTqsN7uHxCD3AgZHFfIIWaE/3pKjfj4Et4i0hT22+1o2ztUY0=
X-Gm-Gg: ATEYQzyoNgKdsAFTQ766tbhoBO+x6w5ZEm2d2A7ij5/sP05+s8DvvzZUBtCsjOABRil
	YS9Kpl1ipES2itjdfHQ44j38lcBS+QBop7MS6Y0/0TOG/+BQPHAre61+XCckP64Y4OnEhwBTK+Y
	B4ALYWcilDOjcYgswdGFnn8oLZGHc7FbbCN8llV+/N6m3dWFH/n8Grfi4V9jczwIqtXbVibd1yU
	9AQBsfTAor8oo6b2opNM2bEG0zxBx0h4EB3VsykwV+qdY5gnhTmG92DItPXllJ23V5722mdscYj
	gIdkYYfCy/7XuOaKcJkW3TFTHCR6n0OJG15hWNn8HmHWXtzsHCHpJaCbQFNY0p9swqLR2rJtTMh
	8mXkmLjzIAE0OaUw7QlGX9yVWNOtKnm+isUPaz6VmvcKLsYnSEUQc9hZJr9WNFxEyDqDwPz97PC
	zinys=
X-Received: by 2002:a05:620a:171f:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfad27373fmr254278685a.3.1773826322538;
        Wed, 18 Mar 2026 02:32:02 -0700 (PDT)
X-Received: by 2002:a05:620a:171f:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfad27373fmr254275385a.3.1773826322008;
        Wed, 18 Mar 2026 02:32:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9b0asm1287145a12.14.2026.03.18.02.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:32:01 -0700 (PDT)
Message-ID: <4ac195f3-0241-43dd-8e67-41b56afae8dd@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:31:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] clk: qcom: gcc-sc8180x: Use retention for PCIe
 power domains
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-5-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3OSBTYWx0ZWRfX9uvOkbQhQhWT
 J4nuGHCH6arZKsNf7NnrOKU6Wp91u6E2gSwSmGOLCgAUz87z3oqIMHWKQgNWfBdHSej8cLYMPM5
 +Rnp9stiZYfN9jhyO6Md3jmwdne33/CjwefnLfK5DXjilmeDocPd1zQ2Jckjc3CoCrGcYItgl8s
 Bx9RohMfxMKraGIOVW4mlKj1cgUSRdjSBSLZjny/WLsk5mazvA3S1s0hfnTTpEK9fKIJROUqhDG
 rQBowwOR2KXcANMA+p368bi9Cj3e/w0QfXjXZynjj3QDRbQLfs3R+FmsfUxKOoEwSQ2UaMJ8AIi
 seT7RS5o0PU9tjG3U0FFcZ3t+REPc8Zr1dXV4af7nnXRDjYtP5GlDF4miz55hW/hnNvdV56Bwwf
 +umEA4UDAIP1h/kTr7T9AenKZUeXs6EnLsBzWztnMAboRPhOrMWl+mwgT8v0AjmS14DqS9KtR0i
 LHcdYbiNePEqFJoSwNA==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba7113 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rY4xH7PTqmT0HzfHl3EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4y0cpzyE6Mb_MAIQSMJX7l8XkDq9MZWj
X-Proofpoint-GUID: 4y0cpzyE6Mb_MAIQSMJX7l8XkDq9MZWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180079

On 3/12/26 12:12 PM, Val Packett wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, use retention for relevant GDSCs.
> 
> This fixes the link not surviving upon resume:
> 
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: Disabling device after reset failure: -19
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
