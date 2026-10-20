Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487054;
	b=bMJGTIa9R/NIaw6uARCwKJkf/6xqC3KBYAkmXa1GN/OgznDFiTsDxmygUeKP9TKnqO/p
	 a+iHGrxN6jxMaUDmWRfX+jP0sFqBSMNOllIjoJfBqGkFmmeVuIbcurzT9wFHydP9tw7qX
	 8ZRisXJovd0pdeoDgfHTMZd+k4Bnz9V8YyRFw/QUSWZWdvapJhCoHvz+iBwCMOOiAJbZG
	 BfZdh6OvacOamqYhLSrTs7W8lCFUZdQCdLjd8yODvsESq4yaYAR02kb6ddA9qwIZydfaW
	 dqlgJ6Fa1JQq3PwSR7tW7/28jZR7+2hWfhLu7r3SbwlR/zr9YGwENe6BT5a3IPdVRhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
	b=FK4L/eJbPmI4XZ6w04KEtvCjK1lm68wJ/UP8JWtZSUIGr/dlV+2lptHsruXs3V7nYTm7
	 iZqhh+Eyx47ubx8f0NwjntpGkZD/bwxl+4NMkmd4NZmkL0oK2+PGLPWPZzZSl/pzALhyc
	 +zgtZ/g3A1j1vRQtaRT2MokJF3/4jXS0pF+FRHPrxGlc847bqHgAjwIKI9oU8VLqous3T
	 /ufFR7DRp9UEfyewY30Emfs+VM3T0GztKh66c9ShWjaFY12g9g+MF3M9trNYU81sKKD/m
	 yWGrw+7mD8qm3fGaFUo23zTn/MYZB2Gf/c/mp8F73elfzl1krWcfCmYufOdeMQr0KCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81D8606A319
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81D8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8BlKm186035
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wzX1TW2NwI+yWssGoHbGc+/K
	6ykZuk0NhVu5SB7QmUk=; b=CP0BhtAmyCT6JyLAkmqWdyIfIqbOfM4Nfxl5Nrdu
	KmRJTmyZosrBtw/iaRX1wdVgSBjVPmUIMVhWovX6ncpqb9k9WXXADINBVivRrH0q
	TbLtJ84eSTo0UiODkhGpq4usdA8zwPF8z83+bxw26VUz8YVWBXoT4OUEyYGJV6Hy
	OgFc1mR7lwPS/vEnfHXLIdHIAO3H+a5M657e0Cav7BGQx7B6qT0TPsmMJxpLhtty
	uuZHLlvmiZB+dNueEAJs3pxrSQyBMvj80JBx9FHzhsiKpg8dHXXPrNyE39DliMTJ
	Z3DLcT0g7H9c2ntNhXDqgb+0OGyskd802zcs65EcThsnsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsrsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 09:04:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso612870985a.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792487052; x=1793091852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=bSpvEH87sYF5X9Do9f74ghqyunqFSAT5x2b5vT7JYTeuCIK4yND76EmlHKuX1E2t1W
         zdLOmCaCEg3BctVhP6zkJ9NubH8p07JZ9b2DYi0qkUr/GjauUelho4ssezuiIst0asKW
         AyqeSqy+e6mGg+vjewwHEEH3igSEFtLtgvRwEBRnckY9aC2P13f1QywEVoQZlAWJToZF
         Uat9pTO+aVyo+JvJxYMkiHXYZw9F/qYijHVa9nfwZc0FWs0001yyhPS6evjhaLX94B9c
         nwG4AtYlpOachqr4KjTuycuMZTyZY2eKMz8/qUnZmZGWMfv0Y8MIoPoahAGcKQNZkrJC
         CWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487052; x=1793091852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=JaXt0ZuZB3Ip1Nl19mWlLXlNVBE8Y/NRyR3Blh21roaYyEMK2qgH10wGVL5tF6xiQH
         rnwc235s1z1fqfun5AICbCUUopFlgI/INkptwXhEx7o3fluPzwFAbGTdF1BRp/7SGWdu
         hw5Lrlrxk7aUevUTT7PkGUVJ3ZtgpsjO1CuGyyLGefYWE3UbVAfllcWhfNJYO7RYmbS8
         xFnrEs1eQkzcRt1mGLkfc4soyimkOZyolSOUs0gXShM7Gb2JOzHuoYxSfHt/eQfi4b2N
         6gfRrjUZzIjQjLch2v+rlT6/CIfeuAB4GhmSaJtXTsgzD7TCWfjuSagVrrb1yW6GaIgL
         E2Hg==
X-Forwarded-Encrypted: i=1; AKwUvBy96uIxjEEPF8I+oydaxsdJqeHtEEf1lAM1RVLErX6VFtxqztcywAmXllvuYYY0uNGH7DypDHp/vik=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF4SrQRCMLWP4nsp90mqlq6uPzyo52D0FDc1bK+721U7W9r0rM
	XIOk5/YcjL7WYO4w6SjGW6eUyXpVqhu3a3BOqhoXR4pNCugwAbtamPFwgVF38Yd7iuNr24Ots8m
	FOM8Zo+KYjGIujRMgRtbntpZoDMnaIKDY82dZJf9oRdxBUAq9TaEVAZCWLNTFNfo=
X-Gm-Gg: AYBFou05XfHIYqfrvPdBxC1C33GOrlXg6sLcH5S4Gex4Y77aWmKJRmVIs+4abl9ePDE
	zFVSr6m+phREHzBc0HgfJmxelhQY33ck+dSnXkLMNaDpnchSwdseBDXkAUTTsx87InEqdmKynDo
	xEomuoL7FY4VE2ILHJJcLNq/MgMsnoS00pVXyPGXj19EIq98E5fMxAQ1/gerrov4jpTqAJCnCCn
	9AK+NKuzPVYJfcUL/d9yv3dwQBC/FoNj/9IpuZqT9R6viq8kwZk00xBuXmSgGnkn/nW3q74cqKd
	rRYV7C8Q535sP21oiy2EMWTucoWarnqimnU82ESYo3nWHd21GHwWOdnwCoeIrA2utMd68bsDs2q
	do49141AJME2Rc6mYkwIpCcjcCoFcTGtf44tBYp4Zd4kJ8ASkW2UtrAjRIFt5hnajnvcEnpVDdX
	5XiCLLketNQYPY
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724719785a.2.1792487052010;
        Tue, 20 Oct 2026 02:04:12 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724715685a.2.1792487051406;
        Tue, 20 Oct 2026 02:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434e4csm2531830e87.42.2026.10.20.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:04:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:04:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
Message-ID: <vs77pfhgismmyrx4ftmsrl5hylwcjpxirnjdw46c6wu2jcvczl@4wbizp5p247u>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
 <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
X-Proofpoint-GUID: fP7PBYthKYz3g4gGbVf2G0PafJJv2_do
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad72e8c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_XvO8LXBJ3Q0iDersrIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fP7PBYthKYz3g4gGbVf2G0PafJJv2_do
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX5TqTw7d5HtCu
 rDIPEjJimHE3fh/T2PuFk/PTh0PV18u+JT+2aT6p78wtbVluFn3tN6r6Q9Kwn41bw8SgYA0TlDu
 /SKvbQz56kSINwbUwko6iVM+y14zL/tiZpVn2g6KGKWPnbM/EKPVkIwI3+Azi54ueU21+SwRkmO
 VYUdvbtyXRkIiU4mMUmt8KT4QsAIVw4QJI3qCUvG1vxynbNHduwd+0GQ5EPArra4eNDn57zddpp
 S6soLZunQPISXlP5gXeXNXjOmJ9+npOLJHQ02qtclslCjhnwCL2DfY/rzZS/0aNOrQ9G480PU+4
 VCVdoeIZJLmuRnN1UNYxUPaSFHQeoXaXywRE17p8qLdK1jSwytu+74Hyx2NUiHR2uA0La1zeexD
 z4SgbRa7gj96eqR4BNYGImSfZ5mrLMBB9fcUIr9KWzdk9aapeKYMZCvdraPEeI618x9HjYH2+1M
 iQc8c4Lzj80ZJDSOfPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX1qs9GA0YTb4M
 oc0zhqGAiBGkj40GuW7G4h3cPT2O9jXfvhill5OLNauA9u1TuNmeAyfk75OyGh7CBa9dcUmDH7s
 5GWavLWNhVLEIofLPXdag5NZaLIIPCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

On Tue, Oct 20, 2026 at 10:35:36AM +0200, Konrad Dybcio wrote:
> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> > Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> > ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> > unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> > cannot leave halt unless mmss_mmagic_maxi_clk is running.
> > 
> > Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> > and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> > because there is no bus driver to manage them, but missed this one: its
> > siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> > mmagic_video_noc_cfg_ahb_clk all carry the flag while
> > mmss_mmagic_maxi_clk does not.
> > 
> > Mark it CLK_IS_CRITICAL as well.
> > 
> > Note that the halt bit is truthful here and must not be papered over
> > with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> > silently resets the SoC.
> 
> Will the right fix forward be to grab a handle to all of mmagic
> for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
> a workaround

Most likely. Some of the clocks might need to be removed from the voting
model at all. I'd say that it's a separate set of fixes, possibly
affecting other platforms too. I have it on my todo list, but it's
long...

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

-- 
With best wishes
Dmitry
