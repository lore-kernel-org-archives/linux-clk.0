Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180730;
	b=JHnJBtyrw6wcEu1ShHXtf0i9kVuj10GSGaqaRjtWoQC5HnjdkeHr55yJzoOjViE9ZE2D
	 Qg5DaafdMsjE2Zk+ZSK6z2jUA+pTKkkbtZXlmWCsZSx9ivx31DROiFut/2EHuqKJU3Ihq
	 EZaeuy08NVvogyRG2AU+do2Of47Spc/Vw2Gi3QWUHQYVwEbEG8Sv7M6a1vKbBcegO6Lz7
	 SIBFydEBjTX3io1uvx3TyQbt8SX1SuYA3LpoJmITMHkD4WXrhe3htS0ZKHyzw8vMA86Wf
	 DahiN+Igc7c8iTR2vhggSFPhf/eMNe9OknrKf1ZH0iwBZGaqYdL2evkipgi86HW+MjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=frZTF27BrC8OiZme1Pa+xrXgh3Yf15FRXkfaOwaG0nE=;
	b=MF+tvGu+Rk3STC5wDbY5+x7Wi3g5AOycwYkGiMgSdpRLT+aFaTpZ2HGnwftd/X/W6wPO
	 Uq0PuAiUQYKaCxITzH6dZwgXOC2Qm2pyJAtZ1PzAnPeCfGLJ8QhCUjkmjZ2nkIo2cjJSf
	 qMlnw0rES0FepsMF1lD5QLkfSVdE3RpvrpinWFRmU+XYEEbQ5rp5CTjr7IVxXhA946urd
	 QpYkH9fViOugi/mh1UQ9lGqkxqzPjcSYR+y0Kq2ynRArvkGF0SVbiFfJiMK0w8JGJV1Ze
	 B6cqW124OhN7qNRm65SW8K6lWo9bc6QERfVobujsGNCfBTF0Rm7vAPUdeaPIpjhMZ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OT2NoEHf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQIUI73f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA9606A32E
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6AA9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OT2NoEHf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQIUI73f
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KCXB1642992
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frZTF27BrC8OiZme1Pa+xrXgh3Yf15FRXkfaOwaG0nE=; b=OT2NoEHfUeGVmwyH
	U63Kk+O2Q8YOKu5iv1yrYdawHbzUNuj4ZlXWUVxQkf8UktylD6+tgmLkogYnVGkv
	SzmmcHdadMAEL8hy+6Sbv0cFrHntyULgGPzMVAYZQ3mlgiwkI+TT19x3At/wsZY9
	7a0kQeFLrYcTN9Bz58nLSHaTkB3HY7pCws/bKcEYaikejWNh6lfNYYR0iCWXUd5q
	m49ZmqtOTrmDCpPMZPCspXzJrRtE6ktQMBWTPRe+OVTI9JNXs+yM/jFUvl7/VpA8
	0SW9hnhLQNaJuQLlbhOYlt1TP+sxTbKUlofaLaDqSia9cmOE2pPFxfNZgB8AWF8l
	ucnsqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpuctn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:45:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso157652485a.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180728; x=1793785528; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=frZTF27BrC8OiZme1Pa+xrXgh3Yf15FRXkfaOwaG0nE=;
        b=ZQIUI73fPosffKzurOlfXPUeZJXdJiJCiiz1DLdhiC/zBeMvLRVTlk+eHJzJL//yon
         x1/YP1eAUBTCqu1GDNbQcv6Z4uBzZSpqY+P7gNaM+nkfF7pHv/ZzmOQSnLKM9s2Q5jxk
         R8aXA+VPZpOkUghSMJf9AkyRWkn86/ukDmc0XmB7Hd3nMnqIFtyJJLZhVinfHj3S5XwI
         MG42PHn1Vk1WYet2BT0tUJCeBEpVuNQ93zfYFupF+u5VJekXNR3LUGscEhMeAQvmaXq2
         KfzAlfIJKXem9za20A1Il7cqgHCGSac9zsu5fMtdNitrOGIFIcYi2v/GTlR8EJ7lu2ey
         PMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180728; x=1793785528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=frZTF27BrC8OiZme1Pa+xrXgh3Yf15FRXkfaOwaG0nE=;
        b=1Ym0cmEGR/7EM9Erz0S+w8dFvcMfxLGT4PRqTBVHfkP8LW5HmNngVkp3h4vR3PX/jo
         aomc9jCrgrWrAL2wOI3wqh5tT7SUYlLDVxQp6y9yjilrKWqDjpk/l91dudv54Z8KA8QI
         QIU8A3zLYVtt7DOBBcP5M3Kl5ntutCbe4fP+pqVOxgB5zbyoa5IZKLl5Xh3/2nQKTyBJ
         tKpnNnXz/nZwQlhXB5X569tUYViXQnD6cFNXwKpCBqsSFMVNeGdcg0wZ1WMdJz+5tv3J
         XrP3Vg94N5+Dd9+rRqvaPXZqcJkOuF4lsf5sYrBUhK23W9r50USZ6hoStPlkQHzBEhZg
         czUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo86F6rWEA1YhNzbHszsY13qGOh6ykY8dVhbNcZ0+BBH6+Ot5KQMihWCFA38r6xY5enAotsorlq4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYkTj1WbB9XC23cjxgHQFEDtC0mmzP797CipkdkD8yvJx9MTeL
	SDVsbJMfQh57XacrFdIM5OPzDRtbboZHN5dShgOSmajqeVSBrwcRLZkI1xkPHQr2SJalUjCr6+b
	yrfr6ciD4opOad2UB99TYO6Hle4SH2486nj0GxA6pRLxb6dHAgAHfQGkswz/SFfk=
X-Gm-Gg: AYBFou0Sst8NF/fhFg81uWyofl7O+1h5nAou5+60vATEjVmwr4loB6E1r1lwRcQcdBf
	hUAkptj0G2UXCifdDupLd8rU844fkPu3E66Ap1xGIyBOeoHVcNTywuMKEZJdZmkmrOk4+lAyaPe
	k8PobD9SEle+rejdY1X4FP2LkhxytyJFFCQT5enRxXMaJBw6Am4BC8OCFr2ywhqMqJlGwAUfFoE
	RhrBd4z9Zhg2YI/oWk0ZjiHDoIM1B3Ke4ZQyISpC4nlqKoEzeXGrXWTwvP8lTH5uxIkYbtIvVJw
	4CjXytR1451RqKzYcyw61P2Qdil+gTnzFfRg/ppZnqCJ8DLZDdA2cznfLesnMXznWGHiLxbMzqI
	HpJUs7LHf5tLR2qyjC2m3ruhlX9w4MTYdEh/G6wz4GA2o2Xq/JzmBd7uQyXyVAIA8+g==
X-Received: by 2002:a05:620a:2724:b0:93e:c35b:2332 with SMTP id af79cd13be357-94408d39620mr210233785a.73.1793180727675;
        Wed, 28 Oct 2026 02:45:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2724:b0:93e:c35b:2332 with SMTP id af79cd13be357-94408d39620mr210230885a.73.1793180727022;
        Wed, 28 Oct 2026 02:45:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a979412e04sm37684805e9.14.2026.10.28.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:45:25 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:45:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
Message-ID: <ujudp6c5upvgghpckgxdajjzvtyxffgk3advnkrqhencgglikg@6cva4nuxtvqs>
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
 <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
 <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
 <hmslxyt7kj3w2lyniw5sup2dcjfvsndckwhrrrk2v5ofpry6zz@nrjflylnt77j>
 <76mvypefoe6l5c26xdycrxcyrtkpxmnybi6bm5xyudqqcbawg6@5dzvmwkhqk2e>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76mvypefoe6l5c26xdycrxcyrtkpxmnybi6bm5xyudqqcbawg6@5dzvmwkhqk2e>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX0v70nLBO2cOz
 9RLrGuORL1jVr8DUTGELAmkm8iBHj71f3InvDb90iNF24Qk+hFnYGgFFoREgxRFbCTeZG3mspWh
 4n0el4BlH2V5EUou98QLtvn+pYZK1+pewU3zocR2ErBLnWG5v9VoD2G97JKNy6BuPupv9RSCe1J
 gLnvry0uUk+XnybP/n58I3wLbInCVo/4E3oMSCMGIMx/AxBKXHvlFmQNkmBXYiOrqiP8S+16CkE
 vJFesrey0+yeRrfJqgaQtWBCPJ7yiWyeuRqU1zIJtYcVlCGq7H0a6UW+IJ02GRweBxlvQBwNV2N
 4w4cBcGlStV0rloH2IlFOsosjBsmXLb95jx27U6ilOOv4uch4f8MeZbpPx7LO4Rc2uqBgdtI83L
 u82h5w8p7tGdpof/OkuDSB/r8xsXYAchXMx3KkeNj1P5pcsxkCDBCR0BUt09QcSxadvGcMp9C7l
 8p2iwehKRwgru5751qQ==
X-Proofpoint-ORIG-GUID: s2exVPowYWvz20kuLddGkNKPUIMoXRwX
X-Proofpoint-GUID: s2exVPowYWvz20kuLddGkNKPUIMoXRwX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX1H33jvNA3HOm
 H+bLeK5MDbJyuJPvGM+5MIojh3KD3DYy5njGAyOdMazcGGFVkj9d7nQeuOYV/qoPbqT3x5eHpGC
 BuLs544FddYUtZnNGIb7bAxCzNvgWsM=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1c439 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CaYS8H3vlbMVu9Z9StYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038

On 26-10-28 04:29:31, Manivannan Sadhasivam wrote:
> On Tue, Oct 20, 2026 at 03:41:54PM +0300, Abel Vesa wrote:
> > On 26-10-14 14:09:04, Loic Poulain wrote:
> > > On Wed, Oct 14, 2026 at 1:59 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> > > >
> > > > On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> > > > >
> > > > >
> > > > > On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > > > > > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > > > > > gets stuck off when powering back on, preventing the system from resuming.
> > > > > >
> > > > > > Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> > > > > > state across suspend and allow the system to resume.
> > > > > >
> > > > > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > > > > > Assisted-by: LLM
> > > > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> > > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > >
> > > > >
> > > > >
> > > > > Hi Abel,
> > > > >
> > > > > Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
> > > > > collapses.
> > > > >
> > > > > For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
> > > > > the below changes from PCIE side helped to power ON the GDSC properly without any issue.
> > > > >
> > > > > https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
> > > > > https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/
> > > > >
> > > > > Can you please try if above changes are helping on Eliza also?
> > > >
> > > > Thanks for the hint. Mani's patch (v2) is already upstream, so just enabling
> > > > CONFIG_HOTPLUG_PCI_PCIE did the trick.
> > > >
> > > > Suspend/resume works fine now on Eliza, so this patch can be ignored then.
> > > 
> > > So should the retention configuration above be conditional on
> > > CONFIG_HOTPLUG_PCI_PCIE, or should we simply depend on
> > > CONFIG_HOTPLUG_PCI_PCIE?
> > 
> > None. I think QCOM_PCIE should select it.
> 
> Nope. It should be selected by defconfig [1].
> 
> Just to clarify on how the hotplug support is fixing this issue. Once we enable
> the hotplug driver, the Root Port will be allowed to enter D3Hot during suspend,
> which is a pre-requisite for powering off the PCIe devices and the controller.
> So once all the conditions are satisfied, the controller and devices will be
> powered off. So even if the PCIe GDSC gets powered off at the end of suspend, it
> won't affect PCIe devices as they already lost their power. So we don't need
> GDSC retention.
> 
> But that being said, if any of the PCIe devices support wakeup like WOL from
> D3Hot, then we do not power off the controller and devices. In that case, GDSC
> retention would be required to keep the controller/device state intact. You can
> reproduce this issue by enabling wakeup for the PCIe device from sysfs and
> attempt suspend.

Thanks for explaining it.

> 
> So to cleanly fix this issue, we need the PCIe controller driver to signal
> retention state to the GDSC driver or the GDSC driver has to figure this on its

So until we have a solution for controling the GDSC retention from PCIe
all the way through provider, what do you think should be the stop gap
solution?

