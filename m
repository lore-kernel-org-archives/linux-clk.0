Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28CCC4167B
	for <linux-clk@archiver.kernel.org>; Thu, 29 Dec 2022 17:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233975AbiL2RYl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Dec 2022 12:24:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbiL2RYN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Dec 2022 12:24:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAC515838;
        Thu, 29 Dec 2022 09:23:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CFE52B81A1A;
        Thu, 29 Dec 2022 17:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8839CC433D2;
        Thu, 29 Dec 2022 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672334635;
        bh=B5vexTnIBJ/5dHK/It6t02JylZ4eGzp6ye7wQbDPt4Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f/ow3LFFh37shR8zOrBLm0U7AfOTkZVZxUJk7VpJ1IxEkBCBPTWYUvWFn/dwAAwK9
         /w34Tzvztno8r6ygoaCVYtQbrRPW0GyZYFtGvhpElt8X8Py5bKpe9JcvCnfFnUwKJP
         lxaRTyoFe4eNUr+8G0mLmbkU7OJzQymrs78mmTa6fhusM49daSUho9Mqi9uwzIPBYF
         uvs11x241PcdJ+YCNaPonFZoJLAbO5lD1sSBFLbSeIFG8IY6ClvmNgjFGqbFgBTYCD
         gy5LL+nr5IYjsw4KdG6yq0ZU4JHBWq+UG1X1cmi6sEKFCnKBquhiPOq2iSFqOLi7bM
         TCdjC3ymoiG9A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     agross@kernel.org, angelogioacchino.delregno@collabora.com,
        linux-arm-msm@vger.kernel.org, martin.botka@somainline.org,
        jami.kettunen@somainline.org, linux-clk@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, konrad.dybcio@linaro.org,
        sboyd@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH] clk: qcom: dispcc-sm6125: Fix compatible string to match bindings
Date:   Thu, 29 Dec 2022 11:23:34 -0600
Message-Id: <167233461769.1099840.15414352433129890621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221222210140.278077-1-marijn.suijten@somainline.org>
References: <20221222210140.278077-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 22 Dec 2022 22:01:40 +0100, Marijn Suijten wrote:
> According to generic rules the SoC name should be first:
> 
>         arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: clock-controller@5f00000: compatible: 'oneOf' conditional failed, one must be fixed:
>                 'qcom,dispcc-sm6125' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+-.*$'
> 
> And this is already reflected by the bindings submitted prior to the
> addition of this driver.  Any DTS following these rules will end up with
> a non-probing driver because of this mismatch.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: dispcc-sm6125: Fix compatible string to match bindings
      commit: c045154c30f1cf8d96e3f32269c155b3706a1669

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
