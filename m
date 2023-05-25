Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C47BC7EE32
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 04:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239774AbjEYE5X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 00:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239767AbjEYEzg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 00:55:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB2F19B4;
        Wed, 24 May 2023 21:52:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE997642B5;
        Thu, 25 May 2023 04:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CF0C433A0;
        Thu, 25 May 2023 04:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990323;
        bh=Mh2011iz1WZfSziCV0xQ5xa8csdr9NNFZDv/44j+tN4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r/VNv2uRVXfcYcf2G/sJmaljtSKeya1ZTJWE7Qa6QZW+YISnfE+N4fIjKTF1pAvhT
         zbqcZLsJlX4UHU1pHaiN5dsVNtasHeXvphGYWYAiwnVVaQyEoFd/eXPJAo+fUJnS84
         fyWGuKt4/9ddzY79H+YiV/iVgREDFfOSxhBgEdR6/f/+vhdIJF/+K0Bb6p/RrNGOlp
         E5lx5XgSdN0RqVCuNelEas1MXmnM0VnjPZlOCZJ9MZ+bUiUng0tvA/TNOsKmj1nAov
         h6p6HTrROgGB0xpCV7aSjEUYBgX9CLfTMA9zAs09OcKBijplaW+l0J8JehuFE8T/HM
         SU0YzkDDjAU5A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, quic_skakitap@quicinc.com,
        quic_cponnapa@quicinc.com
Subject: Re: [PATCH V2] clk: qcom: camcc-sc7180: Add parent dependency to all camera GDSCs
Date:   Wed, 24 May 2023 21:54:40 -0700
Message-Id: <168499048179.3998961.13200486557003967075.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501142932.13049-1-quic_tdas@quicinc.com>
References: <20230501142932.13049-1-quic_tdas@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 1 May 2023 19:59:32 +0530, Taniya Das wrote:
> Camera titan top GDSC is a parent supply to all other camera GDSCs. Titan
> top GDSC is required to be enabled before enabling any other camera GDSCs
> and it should be disabled only after all other camera GDSCs are disabled.
> Ensure this behavior by marking titan top GDSC as parent of all other
> camera GDSCs.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: camcc-sc7180: Add parent dependency to all camera GDSCs
      commit: 3e4d179532423f299554cd0dedabdd9d2fdd238d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
