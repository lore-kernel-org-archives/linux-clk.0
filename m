Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3938B3A3E6F
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558299; cv=none; b=CKhTVdc9oYdHxNfxOjw9elA2igAqfORq49/tRiCjUWddWERDOaUPH5IkBIfP8TglfYILk7085MpFu7AwXqOjE9l+GW8d/ZgihP9uTr9XEeiUOoBcM+jJC8OMwI4ECwUlQYP0xHNlv8J5xlq6S+5Ui2dEUTps/Db3zVoLh8dQRq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558299; c=relaxed/simple;
	bh=7w/Cop/8rNMh5YXb1tw3zR8IZlpF/K6B4/PsyH/OZpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqBNc7A/Z+mw2lpKz0SWX7Sn/UsMEEkcjYEfdf3G9l9SQ34QcOM3jM7LFx3KAcTKKM5bP946Fv7JwH45a9O8ilFprtZlS0I6B6unRBL5/WR6h3TeCVmaH5fyNAOmvfWmSOkgaQ9X6pwQQfpfHCysaTVBcwB7kEzK9HDEEQmUjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YaoAd8OC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Thj9u5oc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YaoAd8OC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Thj9u5oc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RPQO1008793
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p3JASRzJPlo+L0XP2XXFPrSY
	1nf08xrvhVUiRcRtrM0=; b=YaoAd8OCi9DqGPBxfZmdQzFZTBGOTh05ZV4pMxUQ
	nBWSDydWpm9WYRA2YudNwG8ywZuOH4YfoTvOG1jlIK+/o/t9gRzlBCXH9tfrcQpc
	ZjpCTSribdeK46rPIgTh70Slq3s/zGsFnQhzFfWIXXTRB6deKvvzUPuS1YQmpaTn
	LhtposxvL6rY6AqzNsz2NyZ8IVrgugMYY4eyLs/t1E3olgJQShZ1hooGalPc6lBQ
	XOmJdT2atBWdyZR+Efg+HEm96e8f0MLW2ORq+WFiWXTcg+k2xt+UlbrOXukSvPFj
	Ph4EmJYaGZvoy3iHFC7Vkb0UyUleXSQsSIdeeb5tvK2Xhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhdv3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:58:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7b3adda4so32821731cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558292; x=1788163092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3JASRzJPlo+L0XP2XXFPrSY1nf08xrvhVUiRcRtrM0=;
        b=Thj9u5ocLYZGOM8MC6Ktckc0QqgVlRDS2E5lBLVHEEtZy+ebyx/sfHVZP9k76BQRbb
         3O5CK/QhurC0lo5s0o5VOBvBWvRogfq4RHUvyyuSee0ir4LUTOKJT/o1TSgSbPMEUjHp
         oHdcyHD1lEFUs9Z71PN+5WhT3s9brG4luR+DcKwPAdUVZ3qU8u5bTZ7rn5c/o0mxKtTm
         p42ahpckshIXhIAkTKf5Q+17kVGq9LcxtIqxybp3nWd3OUEdc1E1SdGk0QumuF7+Eb1F
         8A9HxDyJd4ONf3EGYEuLW1WiGO1BJS4WrmNtVyHqC+yuocGSPgFBeqT/ZWf4MSJDZnwR
         4LCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558292; x=1788163092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3JASRzJPlo+L0XP2XXFPrSY1nf08xrvhVUiRcRtrM0=;
        b=n+odIKmT6QWYy5/FTMbKhu/BvymnHPTwOAk2yfIE5veyjSczTGHoadhDxTJp0wuOO9
         OYmVoGTDc+OP5DQoHG9V8+m03pwj+jku+jP1Tk2I2vgq/HP5n+iMxbNds++M9EXAdC2C
         O/oTeoncBMu+7rQK3qOmrL/NzwxEBB2bWOSOkDMHWdKJkLv5umtc8nV3IwZ1fsMlIDdl
         sLdauw4ChsEf+EjQGIKZ9zcg5o692GFJLYJ4Y62zjVQWrxRqinJVJ2t3xrneU+IkQw3+
         AL122o4rtipfq/tPSmR7IGxiw9X0OQi/bLzntoFL4GFeCsubuyzD3Q7EKaM6ku0/4mro
         /b4A==
X-Forwarded-Encrypted: i=1; AHgh+Rre7vP6Yzz7y758lkFrfChsIm31ElnagWZLBT5NqX8xAS624nhaw1CdCAKWSbi3vDeS82W/uQCJmBs=@vger.kernel.org
X-Gm-Message-State: AFuF++kK9Q+1hXXMI30+zABCkAUVX3sNGJSPZwE8mi3MJZnFSqhz+9Ej
	3Tei1VQ87y7M6Es2C3xQ7UyWV09+aQO2Rj9uSUCG7yM88AalemVVu1uKCe01Nh9KrVQJYwx7WHp
	i8uuDrtiGH9d9lUEc1t1ZDI9JbUzHuRQIfsbpAVbJDy99kQXI6Iomjs3wop15Ut0=
X-Gm-Gg: AR+sD10qt8bjxcs0NWAR55+Weoad4lSNT23HRJlMvLEAEPiA2EhOKQOfziq6RishKTt
	gIsGteAbkxLFn9il4bEhYgC9KobFkCm5zgIRDmkstKqe9u/lOwtph78Wvqgy+Or04bO+XJDKHjy
	EkKAlQrKvwzhCHEpyDzuR+f+wQhWqeDTpL1EuFjIqaZV+QtwtJvxhpCADtjw6nS9EXgm48R11v7
	eQu5A3jsz9pxmPDND3Jq4EJgHHeuYJ2D5nogSn2swQMpJfIgCTVs2im21K53q5LAIdUHdyReODO
	5NfYwnSfdjhlcnAJMRqjLwGlO16aVCYdc7aD1N8QAAsAOLrCmUbTmerJT9SzKX/JVxr+5VL9y6R
	Esldy0Nv2tpk6Mwo=
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr269751901cf.33.1787558292498;
        Mon, 24 Aug 2026 00:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr269751541cf.33.1787558291971;
        Mon, 24 Aug 2026 00:58:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296aa0sm1198117166b.19.2026.08.24.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:58:11 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:58:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Message-ID: <gqmzboqh3njrjgyf3yla7gzmagk73hgeb7qt3qcg3afi64suww@4llrqww5kke7>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 83pYoWRjfjos8fOKwgnEXP_ztjYCAEY7
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8bf995 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ugQu5lbr4eJmBGCNh1wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX2N6s1rZQB0bQ
 21B2T1kgvSBBYiqd6lWIiKeKt+XV6Zqe8YFphsKuWH2ZbZswDims25o0sBG+TEP3eaNFzp/MLUV
 taLsKjwDVEPQYb9Juq7ejN8cxXYa4Qn0vcI8sFKFgsUrs4Ro0YGcEyi1P3NQEmw8Yxn+I7fkgOU
 sNYsTwBcYX0oS41RBRtZoxFLVSRhja9WD9ZHRDb/zb26lSzU9ZXO1ybjHpiJPFVYISEZph5GHjM
 SYZlxhE/uJd+OF969czHiJcsUF7mCJL2A0yJRuAHSnLTOZpU/9jjVhspsiDShfT5ILc5xO7BKOY
 nfL3ztyUXnOKrI+iK2VxpgsxGB2HtOlNswZY+IDpKPdta/wSgJPfXlB9SMSBkA/qNrvvOI9SPhG
 GICgrVN9SdUlOr3xZ7tDt8FG+ivtrzTa17B1TZxwuWhT/nRNSYW4eXD9+Gb7yTCD2yrdR5qcqeS
 O3WiSkgd3D8gl8VWAQA==
X-Proofpoint-GUID: 83pYoWRjfjos8fOKwgnEXP_ztjYCAEY7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfXwhXN52pXzDLQ
 pvH1MWlqS/h2aZKlGWd1GzVBvP6S/k5va0aeuwPUKEjm6nDrrzXxkYjDmldvQgxgMjNzvGDk1V8
 SJ0oU9s5ik9RPDY9lsZc/EEtFXnAOhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240069

On 26-08-21 21:38:56, Hardeep Sharma wrote:
> Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
> new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
> exposes CX, MX and MXC domains (including always-on variants).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
