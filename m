Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFEA3590CA
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 09:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950907; cv=none; b=LZUadA9eZzEkNrJVBY31AS1FFyJKR2YDvQXJEyyH2gi9cmix7CuR+5jlG9IX6dJ+voekkz1zPBSHyS1p5LeyuhfIHbl2jckd+bD1gh1jjaYIneCxOR3iWeqmkHIPkpca+4ok92z5P4NWTv9umHpdu8l6sBpBfPaci6ThkZPFDNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950907; c=relaxed/simple;
	bh=GlE8cDtRF/+zE/jd1X0Q5Rzf0lO09oMaQJAEC8FzyY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oj99mHCwT5nIvb/Xx+YyW8PFvhOl9ghl6ZUtVAVwpe1liucoW3WKZ9Oohs8zMzCsTzoDVPN0R/nXMxGZuyYxF2GiyyJ9k0Ua63l9IM7UULYSHDmRsRpHiZcAE7rZDgUSCNcL4fPtqFdm8ASRErt/MRhnb7UPBnA0nAE2lSnr28M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+acctEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4DiElQc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+acctEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4DiElQc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096SO1q3141617
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 09:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=STtnyGOg2NIu/uNJVJ06kY/m
	sqsNO5lW6rnuZrw8RZ0=; b=Z+acctEvSqrsylzavXwAgD8xBuuGiXuPioT3wsfm
	s7TgwpKK4HACcEsV45emmQ2u4jSPuKnz87HbeWNhCDWlwVlOUKXyx6pEdHFUSG8x
	YqejGUKnYAvksqwfHLQCzhC/VHGdMNjXsGht63jjc5pQvdPaM2braaZhIPlnuU+V
	BYrpzlhj0bTGIroDQL0yItHvWRdnkivVOowkEmLwM9UBoPhOZOxq8hxwTF5Y3ekz
	WnPxzY9j+6UYAaklhX2pJdzlVEfGzS5XwvTf7hAnFRBD3n1G/cGDNjW08iHmHo/O
	IRe4XdbzKpLwYeUGPy58NwOVv7Wd5Pb3MOmoF5+nHBLBqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j23yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:28:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee04f4c632so72192101cf.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 01:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950904; x=1768555704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=STtnyGOg2NIu/uNJVJ06kY/msqsNO5lW6rnuZrw8RZ0=;
        b=Q4DiElQcvpdt5lr3wwNMOPD4nlkVZJCzTHpoXDj0Zb50cyP7+gNTcAvCXwviBAVeX/
         LlCPEYov8DwRdTU85IIymcN19/WNgMtgh9TKx+1EDIHem5nsszq7SluNxhtrDmMKMAmU
         SSe2uuRXfc5eU+4p921E5T9J9CuAM8J6vpUz2r7lBEhASZsk4oAmMPc3mNPjHMDaxJhi
         p9kSIM2zcP5g63fRi4ViHn5rIpe+fPMNDTI8O9Ti9XOAYFN+V4jQel76m+OCcB9UrKph
         385IPFxuruHZE/8awNBnXIHtlDUkCW8AyeVFT0B764KwH80MGfWSHHNl6VM86WaS60Do
         9syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950904; x=1768555704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STtnyGOg2NIu/uNJVJ06kY/msqsNO5lW6rnuZrw8RZ0=;
        b=LbJ8C5tW3SC1ocFP2y6w9kjERvozeR2krYj5e1oJqFpNqGaT0d1JbtnAQ5JZiYlW1Z
         vpOp9FBxta8OJH8wfpVr7LyVm4qOgW58zb1iZtv3dYktwiMG18/AQKl8mS9RmJOBOgoJ
         kR7mIigEGMF26yP5ZY73D1eoF4pkUzzUV4KUdpcETVnhFpqPLEXb4BygJ5aJDroDkCUR
         g8M7aasfoqZxAakgqoEIXhRDQXqKBVdX1xFw4T5+Tit9ncWqN9h1HdcsK3SiNT47AP2y
         nTDDfvypDxwPnQCjPUbMayZwJgftDea2qlIJvgocb5k3J7ARLOScrF7b1ElNiG6LbpLo
         JPsA==
X-Forwarded-Encrypted: i=1; AJvYcCUr3OMteMBXlnIzCwt2X7cu9re+abzh3K6h0eafR1ua8Z6klHZsoBq8lNl2YCSi6GMzWRuXX72myQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYdbO2F5aOhyNWjMv0XUAlkNJEDG4WYk0QAc9Fxih771TGEbM
	KA7C6BPPobZ4wKW6pzUit6KMtqbUMrAdzwWAcbz4FOICCVf74iAWo6beDvpefDgzJ4hIstHN+Qh
	sPboIeq68WuxH7OGE3gHuQV/bKo5qM1vIWGMzY+flwF9nlc090OnQdkynG4QeWb8=
X-Gm-Gg: AY/fxX4x3NEcvzCfWMcggkKscZ1anDT9FMh0mBzKlPKzBS6ufdC/ujMtiZRvY9rvdQt
	Ptzg4XaKjrAEJcx4ArrMbjUnIH5MUPZLpFB37C7W8lZaHiYHR1GRhfN8RPQ/q1h9w/iw5qnpUAs
	zy+4CwOH96MuO+OTMqaxt7o0lYvhwR3rWteG665mHGI6miBplOPzdjyAHrMBaVroWVaeaKmE5DO
	KNEBcH20BM8q5QaGtiPv2Mmu9uqZj1W62Sj0Y4+H36Btew3edDNebvy2yHHSSrks9N1q2vKn6vT
	YyRVSdj84aSnW0Usj2IMwSQvWLIY4/L0ZZ53nmXvUGfXrYfPEVvLKprqNrPwD006i4cBi7x/S4N
	Imm229tM0r+JLT8xE2TQL
X-Received: by 2002:ac8:5211:0:b0:501:1393:eb4b with SMTP id d75a77b69052e-50113943c7amr1458171cf.28.1767950904297;
        Fri, 09 Jan 2026 01:28:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGntynPokqJGsp7t5mjjfXgI6WdJO43V4JVRK5YM1au7l2C00V2hGNLCql0R8jMOF0a7oCf1w==
X-Received: by 2002:ac8:5211:0:b0:501:1393:eb4b with SMTP id d75a77b69052e-50113943c7amr1457921cf.28.1767950903815;
        Fri, 09 Jan 2026 01:28:23 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c3f89sm10012517a12.5.2026.01.09.01.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:28:23 -0800 (PST)
Date: Fri, 9 Jan 2026 11:28:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 14/27] clk: qcom: alpha-pll: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <mp4frljbgcdcqdidfdqsew2brj2kchlyvz263wsw2c6q7jkdbx@rlpoogwbzuqw>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-14-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-14-535a3ed73bf3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX+5rpinhFKfWZ
 gaGi7O7PcqIxXqHjbFjO7oFnNNz7b9wxS4ARaiM+jdPvK9qXk/l0QCFVTIUmFxNTIcC8qtULsUa
 swSrbQ+KR6AiYDLjm/BPrXH5FXsA+CPXObMAECtReSBKjDsnjBZhVmp/KVJZtKKDa7JRugMo5b8
 eaLfwnbzcRvZ5sffwLzs0e4WttN7sIWLEMfbiTMKb0LGi8eHsanYHHlGTbPRNQFfFJn5S+P9c7h
 /dgQQyjaE6Mwfxi7h52uv022C4mdaDQuX8M3cJD+y37nDi5Ytn15rJhNm8pkiyYNyhEByy2/q5B
 QuBKNX10yWVuptUGCwdXDNZ7VVjfke/tNEdoqtO8ocKKMkXHHAajAkE7ODIfJHcB76omW7pK5wk
 XhbvMV6tSHNXGwGlBSOn9V+29AbFoHaVRvI2BQ+b4k19eLQCuL32HMKCFjEYaTT91fhNa6v2/CM
 ytTWMozbfYtHgk63+yw==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960ca39 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: n3mz3A1JoHInvVYYsnV5dqW1sLrFZARn
X-Proofpoint-ORIG-GUID: n3mz3A1JoHInvVYYsnV5dqW1sLrFZARn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 26-01-08 16:16:32, Brian Masney wrote:
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
> Fixes: 0e56e3369b60 ("clk: qcom: alpha-pll: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
