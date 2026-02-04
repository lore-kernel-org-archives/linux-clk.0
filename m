Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACE520F067
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 00:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165619; cv=none; b=Fry+yB8HTccALh/Qku2CTEOS7B7YXqRK7VoIKQ1KQU9rO81lxOkTTrdrfNP9ha1tk63MEgAVHTIkmMjvTGF3IhIgRBWcsZvh+QYQlI+uV4Y4j/e10UZTSWU7vJZOvt5epvR0djYHLaCuDgwLDo+dimJ5/9J3Ht2EZyrlynsRi4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165619; c=relaxed/simple;
	bh=F8G7Eg6ph2x/u9+FXMbeiayUy0HItPcu7w225JbCLP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StPYNn4N9M0CHZp7Bvk4YzfEMJ8FAGSUH7MNOIVAOeUxxeiEVomgQ8lCfXQ0p8bpcb0KRyZLHiKWOcPLXSgfuxc6V9loMCX9pjDFVU3yQeYATbDTwfMH6nCNRbGodeR9KyXrKqS3vrhXNcrzzjn0BdlP/Z5+ARdHkwNrNV++wcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4qbKGWS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAxAuNu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4qbKGWS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAxAuNu1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IllJH2963025
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 00:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lzfUjUVNXkWGUVQZQA9MMFUd
	7EVd3Dj+aLgbQeZkpK8=; b=D4qbKGWSuYk5wQFXWxhv9ULJOl5q0L9KOIQOJYlg
	XGH5YpjxsXoAVN7vjbrdkwNuxcV1uN7mrQLqnKtbxd7g/vlFF2UI/GYPdf6fQ0Lw
	yNfG3V/3m6VO/Xv7vSZa/cHB82UUXT4lj8VExjpPW8C3Mq3/bBSmueW8kaA4mHYd
	KodYnmyi1B1t/pg1mxU57vI6wbg8g2AtD8SeuWQ1BR/IN2lf1/qhEwneLZCPCnzg
	BhAi8yhU2jnsgygNDFfwUoq0WsJp+P8a/k1Kl2gXiX7280OFGttxmR6xK16bXvmv
	FLT/Vxth1Y4wxyUJUet5Jr8PtoLV8iSyJsQIJvnY/j4n4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ne7saqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 00:40:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a291e7faso1490214585a.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 16:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770165616; x=1770770416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lzfUjUVNXkWGUVQZQA9MMFUd7EVd3Dj+aLgbQeZkpK8=;
        b=FAxAuNu1YJxqbCIif43GyBC7Ho/wh8wJv2ZJqLm5afbbwzgoYBi6GFhU6dJ+SPoqg1
         jkS7nU1Gg+qPncG97SnmqfGu+0d70BCIbuZSmWtpuzNutr3kzUCt/J0YO9DkXThlyn6E
         Sc4ZrJqwxCerEkKftyriunvEdb9l8i3xZFbENAe0IeUcbWVGYU7rp/8SxcKuQ+cPcVWT
         7o32dU+NAvs5aNSogo1+Rnus2gnzEBX4CyNMh3AIR+KeGaejCvew/sJZpckqJPZeuhqJ
         UNCRwvBNxtkHIzrhl7y0iY5ZKPgR9YQn/sVWq6a6XYgBOYx3C5paWbQWlYmKdfrjM41n
         m4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770165616; x=1770770416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzfUjUVNXkWGUVQZQA9MMFUd7EVd3Dj+aLgbQeZkpK8=;
        b=G8MgsyEynGxbxfxAsrcLTZrc8dUSMLGE2sNG6adY8P0zzDcybcbBaMWif+6Lzz1fFm
         SP+EgmPytcMlc0bZAtPlB/BNwGeHQNnt8fH6OPycxPsWVLz19i9cjZAiWHvDZdhIj70o
         GZRXMNGRS9My9P9JnjSwrT6iK5SAv28yvnR3wwTeb83FhDo9lDq9lJFEWNPf7EMWMMir
         F4/EVXFicQ0KtgaluxjDZsK9acafYYEV1bcovKflX717IagOfHs4mczGlDID2ATtKqak
         G7wXcOkk+nXJHWxnfkCKwGZ5AdzaiP+MjpGwd7swOA7B9tofyPxXlEHYgONYlU7eZC41
         XmTw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ88PtEcEYuFM13iNDFQGN9hTa/ekqpjTLI8PNGf5FtxCPiLV+j7A3ilexT4MNgW04LVMwD32qv90=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM4pObbZgh1KPjYySL9nTiR5e7LtXzs3K8o5jS8moHd4tlT8cX
	z67c8+M3dC+K9jXZ6ZtSQV1RmEdAxVKkCzlQqP0LZ3vzWdzrFzeXDg76hX2e5vHO3OXPDNsQLvo
	/21h9WDqiffd9CcX0ksz5FRyOKlQJW08vIU7l1c5lGK3Jq6lvc6wIMurjg6rKMcM=
X-Gm-Gg: AZuq6aK5GVNIQezn6AiOMcAqdfsjhevbIp7HOlvK7tpxKFNFZxzFl6kg7/XXzNjgrGd
	dxeX3CcKv1sog1TaBEkpj7l2R8lbi9dVK/3VvXHlhweiAI0fSgB65aLQ0U96eVyn/nlbvs94tTJ
	J0gptpC5DSgQbVlNHCoW5U9Ujwx9BpmuWbBga6dePaFaQ7Chx4Vggc5bCXThXhKMnSAfeP/tURH
	ypc4C5QuMVXbictX4OSCQicO4ILob+56Rd9k5Mj0E8Rtvjtc+T8xbwFq2PrLH3PbiDVW+ZCyY2A
	8g7W+yrb1ver4Zs0qU+a17i1WqYqPDi+0A59yghXVvQRUwsZKIrm3OQFeFzv5oM7aIn55wRzsAn
	jMBCyXAX7kGCRqwQp9NIGpGtm9pe4Eqo9w1lUgSYBCqt4U1Uz2e3QWBtZpFSmZg9IZbeeFUMbu6
	PJdKs0dEHjMGcnzPxDmMBpvds=
X-Received: by 2002:a05:620a:7105:b0:8ca:123e:819a with SMTP id af79cd13be357-8ca2f84af5emr183838785a.36.1770165615901;
        Tue, 03 Feb 2026 16:40:15 -0800 (PST)
X-Received: by 2002:a05:620a:7105:b0:8ca:123e:819a with SMTP id af79cd13be357-8ca2f84af5emr183834085a.36.1770165615479;
        Tue, 03 Feb 2026 16:40:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e38822217sm245917e87.67.2026.02.03.16.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:40:13 -0800 (PST)
Date: Wed, 4 Feb 2026 02:40:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain
 handling on SM8250
Message-ID: <xouz47l4ss6n6jtag44xptv63buuiyq7hikbtormstjt3prdon@nfvyvlksee2m>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
 <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com>
 <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
 <CAPDyKFrX7NieYszgEZXFyQJr+PA266MJZTvJcGFmrQ2oy7Mj3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrX7NieYszgEZXFyQJr+PA266MJZTvJcGFmrQ2oy7Mj3A@mail.gmail.com>
X-Proofpoint-ORIG-GUID: Bh2e_wwjnKfgAyfnrf5wqX6LhLbQEo4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwMSBTYWx0ZWRfX9k6LKRSBPgKb
 +QrTmIKiTRtMEWo1Qw6kPe1VggLvw12ILivwyYyEQz1OSiBqt6K7QqnICzVrIrIUCiWHTraZvWJ
 6isGrUpRUEcfCQklUND01S0Wrx58zjne5cVr++uOFpz+l8kJYM0c6EVZsW49Wu6fjJYk9qRh0MF
 ESd4HtYYYWaAOQtPl6zx6ad0zlRZD51vq62Gv89R5o9dedlqYd0whwdJHFjH6jIKL3zaXsZsnnd
 7V/5m1Ym2d0piKHqPT2wARUtAoMPqS1vfivHTKrW0SVnjNGwiO6oEFvl8boG22aYw0J9GENe/tH
 ZZh7I/5fx8/+ZgH4ivO4HiriFpuia/zffKafYTBdWld8uVZfMU/vHmK13Oby6UU8an+XmWgCNY4
 vdqu4pHmxG1GTwtRRSLVW2uGTQRvzXgH31kI87a2DHwyK/zCHiik9Uuc7NFckBF04zPgxoF5kck
 skxzaR1o3BOnJs3pMtQ==
X-Authority-Analysis: v=2.4 cv=TZmbdBQh c=1 sm=1 tr=0 ts=69829570 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8UNOjA0-WY4o6R8rHOMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Bh2e_wwjnKfgAyfnrf5wqX6LhLbQEo4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040001

On Tue, Feb 03, 2026 at 11:40:45AM +0100, Ulf Hansson wrote:
> On Mon, 2 Feb 2026 at 20:22, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Feb 02, 2026 at 05:51:16PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, 2 Feb 2026 at 16:46, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > >
> > > > On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > As pointed out by Konrad during the review of SM8350 / SC8280XP
> > > > > patchset, Iris aka Venus description has several flows. It doesn't scale
> > > > > MMCX, the frequencies in the OPP table are wrong, etc.
> > > > >
> > > > > Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> > > > > stopping it from being overclocked).
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > >
> > > > Do you want me to pick up patch2 for v7.0 - or what do you suggest at
> > > > this point?
> > >
> > > I'd prefer it if it is picked through the immutable tag/branch.
> >
> > Another option would be to ack merging it through the media tree.
> 
> I didn't think the series was considered as material for v7.0 as it's
> getting late for that.
> 
> Anyway, I have queued patch2 to v7.0 and the patch is also available
> to pull in via an immutable "core" branch in my pmdomain tree.

I think I mixed 7.0 vs 6.20 vs anything. Thanks anyway!

-- 
With best wishes
Dmitry
