Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED23B4E8C
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848402; cv=none; b=GMaIPqm2mbmumL7UT9bBEC45GlyyOSZBhFK01NZvFF+nw9bQ/x8A7cBH38273G5YMpLAxJKiRSwC3vTZdKVUDmhQhcRMU06yvVNriPsdixhXR72vhTmvgcFs2qAyXT9tYVRpgAVcFNm40uAzMxDi43c5QUzz+2tuwuw8D5IZF18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848402; c=relaxed/simple;
	bh=gw69tgcoLcSxsrdQYQcrD+/RXmEiNDvJrjL8mPOGUaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CciQXFGOZfrbkiS1Wiq+N3soANoBkW14dfy7IjdGWKWJoLwZLGfuOGzjR0ApLtAlDh0vIGsijIL1vGuljzkzW+kz66i4A+hbqq3teiBcpvPrL2JeYfKwu+w2CGoNdmciT6/Yzu51Ah7s03lnNWaJ/IP99zALLvOS6q69dIP/yOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRWNwILl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETxRkDHv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRWNwILl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETxRkDHv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXTc3531876
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=; b=LRWNwILl3nqlah/m
	28mzsgN8aYGvXAZI/X+/n7iVRTLkK7uE+FXL2VeLE5nC5/s7FrZXH+kX0KrlKI2f
	q8ZNcnXd8VogylJ2AkTbyrvXGl6LmPVTWBh6k9BGooD94+PxG5ML9bwgT5LN/M8z
	+3MogOSYUR/SvoHObh4CXl2gNTfla40fUkVmeQhcybYnvlYb2qJwYlLG28m82Va1
	sF1P5f59JDfOBoPS4tWaZdwKYUJEvqM1479yj+i1QwZz4+1PX0ml/WDtx4wwQdcL
	biELnU972j5PIujX7n5GaS1+VCnbEbGpnNqtbCHKXlbzxhtfmx+Eoj3tApWhEFpQ
	zbXl0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g37jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:39:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090bc4823cso204464621cf.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848395; x=1774453195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=;
        b=ETxRkDHvM/c43ZKC5SVl/ONPDyooZ/iUWbMGDWBlX69Wq0T5x5/p7fUaaPXWDurf2Z
         +Nu2TlIobswoQ1Kpf7QcPXq2VSp77i09JudqznY9oExwIMHNNgsUP66JrL4IjIBj2ag8
         xFBxR5wq0Nt1CUdMP5ogYn5LvCtxxlVSxtbmuBEOTTBpn5f3Yq+u1g/w30VZl1dF/ze1
         siP7wVbDrFJOxeX3TOKX2JieykN8ttyTd7ftdeWVSlBB9DtSNH32CwFcwtCUDQ+fY782
         RBV+6r6ofyFiNDScKNb5fuQpvS1a+JY2rLM7CBKWx8Z2Ru22WYqNchXWIbJoGLSmwYfO
         XWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848395; x=1774453195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=;
        b=Fgzj4Rh6iqFtz4dHLTuof6tpC0DqHhB3pHhCv4bebSKR9wCO+9gVUXZb6TkZNUQt0M
         nQzJsLxh9G5xwdWYOuK8AFMgJpQwGTcYfBNa6zLB8hOOozdYHjpz2e64tKU0ZWSiXFhs
         KSG/HyklmIJTJyRsOsZfuwCVUMxpG2A++HeKA+9EO5hvIM9POrMieP9Wj0tVSI1Zq0yZ
         7bZ2LemlzhdHmB7Ao9cgfAXhN3URDMxJHfhMJFGz9gcQvWZsvbh0OtQCcK0yBtSCy8d9
         BSl2qQJpVNc9+C7vbFbeRQpplHKAfG88SNUqVnyv58NHhUA4HUV0mayO2bcYQq9HTNm3
         ErZg==
X-Gm-Message-State: AOJu0Yx18KRnf08bDekpdXt/w2hTbm5cfooVflPnUFyq5m7KkK5H4SP3
	Z7F3j4+P+FwiQflXU3ZiRfOi+vgaw6JTF5+AnQxUL9AUYeFdQ/RBsprpgvAjIykap1Hg9WQjDQ4
	4YmqxCiZOLPXeFEYGeBuVmriY7bxhMMy3T0wiOp+8Duf5NwnAp9DQ3QzvBxgV9fU=
X-Gm-Gg: ATEYQzy2ObUTI1eLKrzcmasJ6/N7MCkSL1YhMW6U053oG5BKWG7nmg0oHbqkQ68qZIX
	XIIlUGEiNa5SzjQSuC7kuNSE3ZrGhH51wxchCVoWDzjrxw8vhkVR+bVpjNJbCM6vl510O0Uzre9
	GaPirjYWuX5ziwOrmyaR5andjhbWxTJaE66T7k2MFLiHCD+8ALhFA+LY+ukTLezcBQmamei2Q6C
	rZcaOPtphKjYUTbEcVeJJwh3YbxR/iTGpMoYN05EVYYeJTmqbJS9bVvHU1ipdznN0psdlWtYt+7
	5i7tszv8ZhBNFySDpIBbMgUNaEyQwVe5nTx3seXnVnQbIIcx3kt42kIkoH0JtcIEDY9tX7GZJao
	OZS9YCCp1SD0oIit9DAAKnGJrboI=
X-Received: by 2002:a05:622a:344:b0:509:44c3:5ff9 with SMTP id d75a77b69052e-50b1485f448mr46464551cf.37.1773848394607;
        Wed, 18 Mar 2026 08:39:54 -0700 (PDT)
X-Received: by 2002:a05:622a:344:b0:509:44c3:5ff9 with SMTP id d75a77b69052e-50b1485f448mr46464071cf.37.1773848394077;
        Wed, 18 Mar 2026 08:39:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
Date: Wed, 18 Mar 2026 17:39:31 +0200
Message-ID: <177384710698.3709943.4935089017687987129.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
References: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69bac74b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=r2wPyHcE3phNYcTLgkQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hfTX_x7solNGbTh88kfHKxxlEnjMGlIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX6s8WH+ujAdb3
 oWCrlxde4iz03BdADXuVi5fYdwAhZd6TJLO6D2MdBLGENRnOxnDrEM5ZOfmo57L7u+goKXSTbQx
 DdF1/kyhQcN6fJH3WqLs9NkbeOjSTt53Ckab4Ari8GndeMMNEbEytHpJYYNzJ99AXmAZh5Rw1/4
 DHj8Br99enxGXwSH4lf1wXaz01ExT1Rwd3MiDH+ADak424VVGAXYAHsnINpGLD0kk+j+nFXhZPL
 qLRpyMmLsJQ7CKFfQqXsbhaZWlpm5fIX9pB3nFI2wzDtb1RDxBqBysGCtFJum5WTIkx1cbStlOp
 qsdWpQZwiAkHEd6APUHeUejRlKNjXmD5BalU2SNvFi2BSi7Ql6wpPPUyWFxMCR92ZC30D3A7RMA
 LUqk0kEIg1oJNbF97qQGigGvFA8fyuAODiJznmVWX6jrP1Ep3XxXObu/xbNHJSFZoj2vy307rUG
 67TXOmfzVd57ov2tb8w==
X-Proofpoint-GUID: hfTX_x7solNGbTh88kfHKxxlEnjMGlIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Tue, 17 Mar 2026 13:19:52 +0100, Alexander Stein wrote:
> The debug outputs use %d for clock rates resulting in negative clock rate
> during rate calculation.

Applied, thanks!

[1/1] clk: imx: pll14xx: Use unsigned format specifier
      commit: fca8688a6798f6fee6b86ce0bc39d1cd0b1c8b8a

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
