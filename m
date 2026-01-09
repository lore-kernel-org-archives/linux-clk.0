Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602C3590CA
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950967; cv=none; b=geRDqfMVJefePbR+87TzqhkD5E+8XswIiHN2YjAsX94wM0RAPVjPinIJgRIIgkaaGRiP2KXscnq3J8jfnsgJ7NPnTfWmH1MFzDbWI8qrxjPWmvXWVYIK3T6mJgwITyqQW18wdFMafCtRwrdXy6D3FouoyWyzC2vd36Q+aR8APD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950967; c=relaxed/simple;
	bh=zr5vX6jl/rSlo/okISTsG8gcwo75GCGAKz59GGqweZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcqKzB1m6z9zkWgTioFa0o6qK9nKpaCv8oxS8DCrINEKyJjRBk5SaTHJ2/wl9rEVJNP8rAs0ylMOLddokYCiQAanCGjghZRFSohztwmAEs6GN3HGctI4Du9GJav3dh9PRwuAE8hRCeJW5+ngrSG4mIFSKEyB96J7evSLvvh2Gnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJTIRvSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARG6LyP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJTIRvSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARG6LyP2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609614K03142604
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 09:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3QEyUWz1m5xAFgMmOWs6+oGO
	/SXx3+n9SYRTc+ET/oo=; b=BJTIRvSh81xOEAoeiJ9cyf3pdDeHjreQXZXMGKpl
	V9N81Mky6kAzRa5tnk82tZLJh0EMwr6Rhnus65WMmzLMKkZCM8Z0kePslDPnt/u2
	4VTzWy+rHCTP2kZMW31YYKN1/CFt8DBtVf81lKJvUDapF9uOEB+Dqd0HDwFU11U2
	CWRpRkVn7WExnA4f4sWRg8ts+oimUqfWTle4grQx7fWDT/fQULTlki1jCg7LA1Vo
	RsZCfGhS7DD1nSCI9XtaEL2cGDHY6O7jrAqPDTKOjdwO4OW+rq33pepoPIAOIlwO
	y7Cxamzvi4NJMPnYlWvUlG8IWPL5GExppMBOBhDaIGIusw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j243s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:29:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2217a9c60so901484885a.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 01:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950963; x=1768555763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QEyUWz1m5xAFgMmOWs6+oGO/SXx3+n9SYRTc+ET/oo=;
        b=ARG6LyP2sgsxaxSR+N4LZe2+2FtxEAmsVeRw8NhAsklznflKEu61i1TkkWWcng8T4/
         HS+ZmhQnBxdFojASeCf6NXFQj6TXSN/2QAHK6K31g2MYROk5liZirEoJtnmtPENu0cvq
         d+VfcUqz0BRTWFmxvYyk4FQpbIr3f81E7B25GxEjNnFwMcpK2YZX+iebyhmlqVCBGRbJ
         qQnGEh8oTxfIvc1adoipw1pgeDvDXDJBHhn/j/6vB72p827ZL5w0pjNrCzQTDt9tO5Cq
         5YuvD/ZHLIc9lgJd9JGghkPK0D5293a2BWTFeVNmHqgWOSIASy2BJkCbEE9T1j6s5YdG
         SXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950963; x=1768555763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QEyUWz1m5xAFgMmOWs6+oGO/SXx3+n9SYRTc+ET/oo=;
        b=hTF9vu7cNdVQhOcJRkQFqt9Z4Y9DViiKksx8xG72wP0zzzLpsgxh7mQqfZ0Q3v+JjV
         dm6aLCbtqicVPQv2i7kdHGHh/BGz3QgdGK9YeooEwWTXsX5MCrXPJhLTX7RIX2fEHjTZ
         WdtejyciWIPKzR+4dDyiLkyf4K2sH9N5sijSRYfcel3VXc3YagrD9HbHvQaQjDaImHbY
         sX7MHoQW8Rpf1BpmhguvCbJWfQx3GuU6YSX5i07VI+wmGZUvOLKG0+LTX9I0ETgrmbX3
         YzR4IVtB1JEAsvvTv+AeJxZ3fQWrZt8IlU+/FUOuu6aoDCtyzLSM39OKSuXnh9sNrG9J
         DKVA==
X-Forwarded-Encrypted: i=1; AJvYcCUrGyo1VCG96eFDew9cx5p8KqF9apK61h+w3bo8y/SX3W3wXnghYrY2x1Q2hcf3Hc1CoB7JYP9Rk3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWohnco8owRzZxGos3/ic7Jem3wv3A3JO+eOjb74t/b3yJCI/c
	i1MbFVZ2ATqHtBoeIyMX/HIMNucLLok9wIu0W+Jok87n9tmJ1NNbCzk8WDiADmegwKlsJ9HgIY4
	0mQD2knxajuZwFe//aoiYSgGDA5mjkNzQs8KtqsdDwbBhsHbqsBOVdOxhw7PrTF0=
X-Gm-Gg: AY/fxX5qJkt8x8woQHj3gPgbW0FHdNL2ktjwfRDlhugD+XVhd1As90T86qQmOksCC7k
	re7UiKzuxBJgsPCZbFVMWn3TWsjbJdXz3xZXWG4GsT3byyONZOgxnhtovvoazkBgwR8SbT+nkfO
	RBlZpQCN8f63YsnBeArIzhZDOdp0+C2tFmkly6q8tle7or9YT7C0UVEmUFoIxdBb+hMvaad8dGd
	lE/4ATGyEGkeAUC777NcztZjF7QqhvVZ1iAqbwQ8silyu7lGgzx4gwzsHZmdXVGeMR2+pSxl19m
	EkgFUKqs/jqhn7J2BELX8e/daeEd7eduY6DV5w2Aqxy0wWqfGbCd9xiCEk/FHARacUoCKFBHhEJ
	UJR6vY3n8vBKO2YOaUSRt
X-Received: by 2002:a05:620a:1792:b0:89f:19e:46fa with SMTP id af79cd13be357-8c389386141mr1133273585a.20.1767950963064;
        Fri, 09 Jan 2026 01:29:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZMgHijfpAuMeXK44EI/g1YoPGI+FZUz3e0Jdn5AXIKj+HSl3mxFC14MNvH9D7SMvxPlzECg==
X-Received: by 2002:a05:620a:1792:b0:89f:19e:46fa with SMTP id af79cd13be357-8c389386141mr1133271885a.20.1767950962549;
        Fri, 09 Jan 2026 01:29:22 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3113sm1059457066b.43.2026.01.09.01.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:21 -0800 (PST)
Date: Fri, 9 Jan 2026 11:29:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 16/27] clk: qcom: regmap-divider: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <6d2amlablpnwewnrsqinw6mdrhnnxvdhfka7nkieritukvqzq5@76b6l5wtaud6>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-16-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-16-535a3ed73bf3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfXw9BNG5F5bxWN
 aytPGxvukI2Tqi3AjcTeiLFLYtCYf/EMIAnla2vmJHWDqL383MlmUULK0GnOBnItqToq5649g/O
 rmksE+IquoN9kfdNEmql1wiCV0jnwBeWjkdIx8b+YtKo06SLJf59Kqbal/7BGGoR9K1Kpe/GZUR
 w/2j1Ho7wd1dLm3XVZOeFmZ28ZVDJ63ASbFYspFCjzi4P68ii6bvSpGHTl5b80bcS55VM0gTS2r
 Iw8++B6CE15KNDWPa84ZTUaQG2FZlK5sTPOsb7bdA2KHXZEhBfeFk/GmdMJ5ogC80uAEMGkx6aG
 I0iOfWRqF/I8h/jSjClqXBtWIssQag2nSVVv9Z6R3en2i1Vzjh5NIpbkl+XXg1XxBwrGpRuOBMv
 IZbcCVgBMB8qThobf35sOhsDiYxcjUrBuTiQ8eqSTMFfIyHA28B0tjtu0MYwy86dq7pVS4NbwFm
 02sj1u8bce5LhkPzIBg==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960ca73 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: E75rQ46xzMGHJIVd455D4OmRLwX4yArE
X-Proofpoint-ORIG-GUID: E75rQ46xzMGHJIVd455D4OmRLwX4yArE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 26-01-08 16:16:34, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
