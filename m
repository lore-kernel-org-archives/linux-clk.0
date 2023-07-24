Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4411DC001DF
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jul 2023 08:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjGXIyz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jul 2023 04:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231947AbjGXIyx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jul 2023 04:54:53 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C1F131;
        Mon, 24 Jul 2023 01:54:50 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C575D6607029;
        Mon, 24 Jul 2023 09:54:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1690188889;
        bh=nPyP49dnhRShPNzgNG3OKPk0ThYGx46zvyJAuyYOCJg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=efCe+vHgRs9HiIsvZK3U+2yvp7/CekPNNT5Z0yfsoMF4ThOqxS2yGm+VDCAUXZjbx
         uN/hg511Xe6C6LwZVit4l0cuXs3LW1WpL2lyZF3eUZtjmQgzhIKh+gPM6LzPZ5NabR
         tREqbURs3ybP/kPK+0SlaY0Xdi+/0aI/rTKrM+lRcagqaeRKc/veBKbZeEQc63pHdi
         V5VRGP6bXxymu3NuC8iLxgqYz0fQYNx+0ri0lRqHHGd5NmkhJu6mj2Zgi9x7Qmouk4
         y2m0D5Eh/RTr+VIANdaRTLGSN9JfrzgGJzMTCQH99KtX7Zpze+K0qpREAwHiPE15BW
         XH72P78iecmDQ==
Message-ID: <056328aa-9856-2361-837b-9d0e69efceb2@collabora.com>
Date:   Mon, 24 Jul 2023 10:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/7] arm64: dts: qcom: msm8976: Split lpass region
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230723140712.9438-1-a39.skl@gmail.com>
 <20230723140712.9438-7-a39.skl@gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230723140712.9438-7-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 23/07/23 16:06, Adam Skladowski ha scritto:
> Some devices like Sony Loire uses Broadcom module over sdc3 however others
> utilize qcom WCNSS, split shared region based on downstream pil-tz loader.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

That should go in board specific files, not in the SoC dtsi.

Regards,
Angelo
