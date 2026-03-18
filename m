Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E33BC680
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848400; cv=none; b=bxE3kZNWPtgpfn7j7UTvAKkizqNSIfxi0wKwz4gmQSVoAlgQ2OiwjxL5/D/91UpJ4GN8XPMoT1naRFuWu2edh4Xe1QUcr0MBPtuD0IsZwxvoEDsThY9QhkhIPZQwGOiPQvznM49Mb1eFiSWCFSqzv4LphpHpXISxZOaA0VV3CQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848400; c=relaxed/simple;
	bh=nzR73bmLIbN8JP6GHPLqUyrWPBe2926e5uSEPpXi/5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWtbLaq1AW2P0VgJDy6xGJp97ZTU4+LSeyv+r8Q1HiV85KLFJKgtIKZYE2K6IzMfh3+3Cv7t+tXc1X/zOcViXna9pW0kZyzdKuDII2Hk0t8SGPx6X8xE9AYxfEIQQnxwTBCqfgqaXzcoTiUcV+mkaGgkpV6mzut/z5IW8T69uWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKzZSSBU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhxVNbpY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKzZSSBU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhxVNbpY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXGO52966288
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=; b=WKzZSSBUrBON1rx+
	hM7vlcAT4WcBvaPwpP3WAzsNFI/Rb+sKPvtk0Tb8yiOaSdeiBAWilE4ZVaw+NG3f
	l6ZkRjKBvf3I02fCT+QYnPDwJjiBamlm2pXOTtgEP/pVT8ueO7Wq+UP2qNjOIKyy
	7m20AaqNZvBefUG9NALIZ4th9ddEMgrEdALwbNVezgvPwF+vhu1VoHDabIZ6V8mG
	aInT6XbUMNuXrJSjJXQDFrZvovv1I8kKfAtsvp6av50T3u+sJW01D5SvwmVD3+jH
	4tw3JNL7AJnqY9qtOzD33l4DYZb+jE/oqgqx3mEBXrJvT1xV4lW37fuMs1X2SLK9
	SZvc6A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ek6au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:39:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093025ffecso71096221cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848392; x=1774453192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=;
        b=FhxVNbpYal2aJwdhvcJLQS8u+CpGk0Nd9CrNr6NDlhWb57ugsFbuSZhOhAQT0NWOxd
         y1S5pfNRDSFZ55697xTmAM6gxqa4X8JQHwMcnydxJcX9BjNu/85y5tp/61fq3c9VJEWA
         iYVEAlr5oy0zFCnxA4yBWT31apurD3zgLC5otjq2OSP9gF9R88BqApxLsSZrAj6i1g/W
         A2EKRyC+R0VRNvOplzsQ4iamu8q1I00rMgEBkWAhl8I90C5cbiOJxKwkcb1qIANYYxPY
         sepK9Z7hQsjci0T7/8N0E9zzuBmT2r9hmtTLMxUMvMlohScJxEBzQfNX+w4lS5iyS5EB
         5Y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848392; x=1774453192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=;
        b=MoLO/msi5Zhcg+KlZiK+ABk+9EknStvfneDAUMX3UpaLfPl6ZmFLtdj+W8XCsqGfxE
         CK1EgRiAKW4i/hJl+GHU78mDQGfikOto6KYCdpRG/K3YD072aoK2CnbRB6vPbv9rjSYF
         so03MBEa318ta71/W8VNDgAXo3XntTHRQS1VE+takXGv63qoy4tyG1KEJsWktPtYOgei
         /WUBuAa6SHdaopubUQ9gHzCdAQ4ESVvzecMQgR9zl9RDhFJE//jyg+2+jKtBYMfBPRSZ
         +TLJ0W3rLsaoUVTAzyF1ZPB+wRuoI9FkS2PGCqwoQhS/qUsyqt0bDirW+OeOHMj6KWaS
         /ldg==
X-Forwarded-Encrypted: i=1; AJvYcCWPrmCVcyLwG2nG96YC2mSUKntLFxN9gX+vR1tmBab4lrfdKhuYpoZK3nenR4FH7thYwNwe7H0+eiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyotIQ06ZPvc5fYhNTsDwa/q6ovmWcM1wYG23td4fqnKZdP65kU
	Zu0LPTiiF8PyYOmSdfzrQIsS2m1x9qdNIdCQdOkxmXmvoxWmd9UOybR8VmEKjbLLKHeQJXn7TTM
	v/fntiH07ecDGWqVC0AHZr9f/DHjJYXud5/vDxAZqOGioscb4BrFIu5hLE15+9sQ=
X-Gm-Gg: ATEYQzzYwW01HbKzTBCMH/+tbUu5YJumunp8ff2DowQAI+HqtGYccSdsi0J4cGhdXbQ
	89+l0nG+39phgVWiiBjNppWjq31Kn0l8TN8A4QPUkTmxiWqUr+k6g8jS9ml4mc3RVhrRBM99m4k
	XZ1GiMPNMAl8+hQH8sEF40PfV3qEltDfZV2svdXyq81tlcEVwjlaCo1ZjmOs89lhxMtVa7XWAy1
	EMAyQ/vWlEE1JWQfDhZMDvNVcOAl4yInZ3ycWG0YJKhBKHudp71AtrsMX+K1z5f8zxr4wwW9egk
	pUK+qqhxNjgmgjkKXjJ7XiYrYTRYOSmg5LpK5jb5kWmY60hfhy2+uaH5ZsvHep30eQv0m2G3VD9
	nTuVhoF9f5/pXHYIXbgGHV4e0Mpw=
X-Received: by 2002:ac8:7f43:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b14970746mr44003731cf.59.1773848392386;
        Wed, 18 Mar 2026 08:39:52 -0700 (PDT)
X-Received: by 2002:ac8:7f43:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b14970746mr44003301cf.59.1773848391774;
        Wed, 18 Mar 2026 08:39:51 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@ew.tq-group.com, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] TQMa91/TQMa93: display support on MBa91xxCA
Date: Wed, 18 Mar 2026 17:39:30 +0200
Message-ID: <177384710699.3709943.15119808744846226228.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69bac749 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CwIvE3oJpDz1FoVedloA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX/9QVSgLXyg3P
 k54BO/j8vD0+8WADy/qt/PcjS+pkwBexV8tx9LcxOrfsNrM2MDi36DmjGR55GWJu8spbdHDoJAM
 6h/ql3WxJxjx+syChY6I+u1XDH8wIpH4HAgRrRKFeey0uzfbSunZXj8aDnHkYuH2HW4eUOL4Waq
 IIEN3c7dFVVAW0xS6AFX1Fm/8r2VVyVGLduP98MJcDe0zTi9qSAeec2RjODpKR02vRDDSzB+LGK
 O4/jjAiJiKwB3lR3Lu3KasgBqiQubT7JvDIpfac8WRCmG8NExf3EpZBX+HhYz9dQz2BV1HPFUCa
 gE9ES/fOWs5HNRkfKkixsHhz6JznDnxy4XnZk3MUgVyg0haNx4VM2sW+ab6NVmJ2CWyrOh4Lwyk
 Bm2O1I1PGcgyvAADflmwgCu1siHcE5+BTWpdbFnKB9lcnoV/0AOXsP901t0nSr84zWtHfNqfiVC
 ke6AczmyMRZshM8DcGg==
X-Proofpoint-GUID: JPU3XH_jtuvs0nBEVZlgcjNMyRQnUABQ
X-Proofpoint-ORIG-GUID: JPU3XH_jtuvs0nBEVZlgcjNMyRQnUABQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Fri, 13 Mar 2026 08:07:30 +0100, Alexander Stein wrote:
> this series adds support for parallel and LVDS displays on MBa91xxCA, both for
> TQMa91 and TQMa93. The parallel display is attached directly, while the LVDS
> uses an LVDS-Encoder. To actually work it needs the pdfc driver from [1].
> 
> The first two patches add required (Video) PLL configurations to achieve the
> necessary pixel clocks for both displays.
> The last 4 patches add the overlays for TQMa91 and TQMa93, although the
> overlays for TQMa91 use the same overlay for TQMa93.
> 
> [...]

Applied, thanks!

[1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
      commit: 3cbcf93329c0d40c722122f550bae8f79ca3e65e
[2/6] clk: imx: fracn-gppll: Add 477.4MHz support
      commit: 0463762fa001cee153ac0edb538fd5772a93768c

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
