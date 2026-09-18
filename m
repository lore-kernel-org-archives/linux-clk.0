Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18CE3B1022
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718339; cv=none; b=nqxJ5lKajNypg32gArAPvu3OBFsoJOEMdIm2hD/buFf71HEs6tjn5be75i9fPIjuNuuD2JtPXHcl0cboRWqLO5wQ/VSYQvpd//swJw6jMo9ru2zzm9a1unjWx2/kwRMyskwR2hEd0GukDToTacvV9xp6kQH2X8ECDdXt5vMycFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718339; c=relaxed/simple;
	bh=RGpT3sxjgWbmCMFX2I68gEn4A3TOcCWmHnfsknCtbJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUesaeA0V+r5ZN+ty+2VttVbvAr7dNexyvyeaswVApAungGTZPB9CK8pPTa9B6m0OiL/cacO/qultyDD/BRGreOZaP5I5ON7SLOl6VDSELhcgu98pXSVM4gbXdaRFK9RQJ4DGCAEjAWNUoz/ae7fcdHUCS+PvWdqmnrDwjOm87k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBNfBQIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTc1hQw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBNfBQIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTc1hQw4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I60idX362843
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HM5E/LrBKbwT43HaG1MhZG1G
	QSq2jkFM3/MQ1ct8JKg=; b=bBNfBQIBRpR738A1numkUW9Jxc8hKcBwGuybnwDI
	7HYqUuCAjTcV3LXM9MTDzI5pY//hhcdZVaku5wW/XgGa2U2lkplRzPtv38hJp/Kw
	3PvTmnhNxv402L7VaxO3/uGWW7jcbEBSvvczw2wLrON5kBw64ovU08RtaG2dtL0r
	5k8gEcGM5PWPHkv3K8Czs272hCC6v7NjZD8in9Gq8jAQlf8kH0NxHZ+a5E6Asyvb
	bOWa4uLF8HixGemii6IsFzFnBtf2XHS0EC6b09muTR2yHCcPjMW/sFDNoCJDxC6O
	xbKgcZE3rSAUEHnv4HoOLRzP19BuEwb5p4ZeItuDyBAiAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6m66b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:58:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso95917885a.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718336; x=1790323136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HM5E/LrBKbwT43HaG1MhZG1GQSq2jkFM3/MQ1ct8JKg=;
        b=HTc1hQw4CVNx/DplTSS8dRESaIXo0HexEqNoTpf+JUOSYFO3UUCFohxELb4UZvzevf
         nrQcsn8Yz27CYfIBQw9FljjcTv+s2xkC0q4eCNZWXFdVyYWicqj5QIZMScLJmrW/Gctj
         oCfYaXUZ7yaeVMuYbTx0QmNK5lihhl17+9s+gD0iittjypMr7S8fnJ6FXSoWvXwdgSu6
         0bf8iMW8jfse/Yc/mUvuhaQRrr+N5YXCak4anw+pN4e3M5Mzpx3ZuqnBvdKZkg43rKyf
         NH7UnlMnbnnvr5xmDNdr5y05e0vo9oXgKTMT2KPgvhYBLw4TDoMswv97nHIUMHHrshnM
         Flhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718336; x=1790323136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HM5E/LrBKbwT43HaG1MhZG1GQSq2jkFM3/MQ1ct8JKg=;
        b=Fjg1R6uMFTD8Mav0g60E9qgm72u+e8GoB5Jk0e2lkKINujnIg/eTLR7b8yi+k9oGf0
         3h4MbjA3n7e6B7O1/Ti46StX/9MSx18eRKVJaf7GdNSQqUYYuwFtlMX1olJGcwbGVOWb
         /uHcE3F9N3pzWyg4/xrZrh7AAJx8n5pkzSyKUxze+I18hG5a90KJ1GOh8Nh8rOQtQ0Zm
         xbXXJw4/24UAfMaVTPPV1+xb3D39TrAWdWO3Lt9xBlvHOD8jhPlpDSg9uQpcEYhLbLz8
         lVxQRH0MffUh1S+oBM60N11Q8Y5qGqVOrFzuY2imNETm+jDZBo8Uv/r1fVd7K6Or6QLH
         3Xhg==
X-Forwarded-Encrypted: i=1; AKwUvBw0MEXfIb2z4keaOKFPJZFXybvjXDm5yYOlKDZcSkp1H525ShZlQMixfJ2wcNmNxwrGTSKldDmszmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lsOAojdmU6uW0YjqFiqX+kINfEeLUpb6V0SC7VeSoA9mKuUp9X
	7q7J8/aaBEdLaPH6CYnMoWA++RQL0UO2afq/e9Kx20/n0u+5WhgA6mPHEyNYu4f8GzTT8OOrn5+
	UtWyK8MItozc/bDeSoJcx2BxBw70FA8dSX7pl+Rbayf98/wYCgmIQIBJ2EGmAocU=
X-Gm-Gg: AYBFou0eVsKsG5T8udaI4godEYwqTqhnZHEB5UnARY2lrfYMPuTWc25mUvMiiepUZd6
	O5G0piczBd98A/oDdvN9YTqQ9RWhsOQ6zOHLqgLA/T6HLqMtriZzuiQF/MFJ+J+1yVCTD5AQqG5
	j+Yfp+vJV82wSuACSFXcpaaJfNb3qZxrbqkCPz/hZEGzdGAXGudm4jYlc3IH+aB0ikTS+JhGvaM
	mqUcJf7sFm3ZmkbsGILBWy2Go7NWNDEGkscFYkDfICgGWFqaI0jmXJymB0VoCHsw/jT+u/gMydJ
	X1srEW94gJVWMhcsrhQRmRq9eEDvOpkTG4PkdkyNcxv5lr4r+JlgMQ6Ul/i6NNMEQ75/K8ATCoV
	z/cqUbs8Lu4dylPE=
X-Received: by 2002:a05:620a:46a0:b0:939:ed4a:dd75 with SMTP id af79cd13be357-93bdc727a81mr231692785a.21.1789718335666;
        Fri, 18 Sep 2026 00:58:55 -0700 (PDT)
X-Received: by 2002:a05:620a:46a0:b0:939:ed4a:dd75 with SMTP id af79cd13be357-93bdc727a81mr231690985a.21.1789718335164;
        Fri, 18 Sep 2026 00:58:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5645sm1900468f8f.4.2026.09.18.00.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:58:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:58:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Amit Nischal <quic_anischal@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: rcg2: Propagate force-enable status errors
Message-ID: <wqehomyzl6qtc5xsde6x7kpht3lxujtvaftmugspwqhthqhius@jop2a6bbxim7>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
 <20260917-topic-qc_clk_fixes-v1-2-5531cb00514b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-2-5531cb00514b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfX6c3Qvks3F/wb
 eZmuB5uwotkdMwvRfONXFiFwNDkWTOqjgvgi9Bvwpa4eEusk+nmqk9wDZ5nsf49XrqmlgQPeU8x
 XWWlPo7pjhZey3ynCV0VsEPxvy5lf63Z+Q3Lp0zceeDo1VoXEejV5Tw8Gn+dRW1dBBX0bXfnGe8
 AW7TpORlXD5o4MFqtwEcj/MsBTOdUs3rSihWQmzwfEfFX68wVphuDCN/D8+W9IoRGbUAN9FG/Q+
 QLaS3Lj2KKBEp3Xy6D0M1PIpdJuixn0jnW2ihXvaQWXvyWxE41x7K1Ruo7hU6D1wo2LqeG35gCC
 V/bZI/tlKN3+oHdS8+rKMLIQhTU/U6cqXpsWH1QXS/EXnAeKaFqUd+B/Qio8aD5aZQ79HvcVhRm
 M4lcklrEgTIhcDdWmqk111E1J/zn75I3VJN6Oo0wE0w424Yw0i7OotTvIT4mSrUpUBDYSzeHSOj
 dQaAvN4rWInT+DZiXQQ==
X-Proofpoint-GUID: KhesnZ8-Z8f_RLeeuwADXvYE9v-_x0LA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfX4SWUC9uu8oer
 CiEDbwwQ8b7uAbNrA8UWcoh+FdHWT8+3sr5L44LftfS9ilqWQoBpfUwD9+Wde4qu8N7EkPc3xy2
 z+3wF8l3vv2MU14HCWsiYqKM0tYsvMk=
X-Proofpoint-ORIG-GUID: KhesnZ8-Z8f_RLeeuwADXvYE9v-_x0LA
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aacef40 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Nbw49Jzf-jmJWK6uOdwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180107

On 26-09-17 11:06:54, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> clk_rcg2_is_enabled() returns either a hardware status or a negative
> regmap error. The force-enable polling loop treats every nonzero return as
> an enabled clock, so a failed status read is incorrectly reported as
> success and clock reconfiguration can continue with unknown hardware
> state.
> 
> Check for negative returns before testing the enabled status and propagate
> the read error to the caller.
> 
> Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source as needed")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
