Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A61D2EAB71
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 23:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756857376; cv=none; b=o+RnPlOgDOdgDskk2cAKZTMych8J3UmGgkIwWxDIAIO918+Z7zIC7tzluWHJMotQFV/m10z1wXjq4nAqKV88XG5DFaqkDg66QZASqKZ4BTbeyMs2H1qXX7AzsiboOmKEyGpcqXFteHUIH1r9rfupYcxdklxrh2n5BifMFxAmXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756857376; c=relaxed/simple;
	bh=888ywDxPyUl4M6zpZ768anwPNrIvU3o92oYeraobAwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEqJ38f1F5U3ay2dtvFgi+JcLukHFiL9WZzvVax2BUTzkba/K3sil/djg7+bSatTnzim3BrCAuxHcLlNwfX4Vvf6f2B2tBGR+1mNQqa94tP6lSkyPE7NL08eSBdT6YgFpZqxUNClwrhundUpCDHBHubDYbt8rLskzKMVrFsv8pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GXHi9bbG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GXHi9bbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756857373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1ZYHDqv025lJgwhhRN8DEjjxbXljdscTG4+1iteT+E=;
	b=GXHi9bbGaoaT5nqgvvaL3tLNMjjAqAgy3/cueDG2vE9lwJNEQsYpCA7O1y/fgVD0iYB3+d
	d7Fiscu17ZP4NLB2Xb2OeEJrhFC+F4PbaK9bhRTCTVuHQQ+c0jYktbYiAUR7FUw3TTOtiB
	9fbtKWp+kx6vCV/q7uYiRh5z3uERnDM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-vlOLAO0qO-WEaKfHPubtQA-1; Tue, 02 Sep 2025 19:56:12 -0400
X-MC-Unique: vlOLAO0qO-WEaKfHPubtQA-1
X-Mimecast-MFC-AGG-ID: vlOLAO0qO-WEaKfHPubtQA_1756857372
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b345aff439so37469461cf.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 16:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756857371; x=1757462171;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1ZYHDqv025lJgwhhRN8DEjjxbXljdscTG4+1iteT+E=;
        b=aG4N+LwPBsIUygSWXpM7TBJ/zJrgv8IiRZLh7UKWcdFGJ5FKQpEbHJNKiiFr+yJRLx
         BeeLDszcxkxbCyCmvK7mkOW2YBo0LibakSLHj8E/Izg1dgbCF428WeDSNmUCMl+FgtiD
         CrpdCT3wzvlzumN678V49p9z36lv0rcjtpAMhOS7i28UNWLNnox2Bqy/g9AXjIbg9WiV
         QmNC9iICloWXnULsm+a6btrpAOqbSRfs7JlhRaJDCpVqDzqXGK5AFmu1BpXbVZWKYInN
         1f+Jr7L5Hb2GOpOPZT18jKg4vcB4XkrMc6MbA2tg0c2SvzxQgQWg+ynw4N9fophDFpqn
         h6vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTILPTp2vTy+5/UERGP4/9Ic4XHzoK/k4953ll8dFcd+k8C15UB+2RY5Q+F54hhJvlJlCdukM26NE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0L6SpVoFdDq16EeT1gnsVoK4pNiOD3Kjpt7leNJqSwPphwPwm
	V11gcaxwArGj+8bMIF4ikdbcpKW7odrsJH+DwxEOIS1U7Y1NCRVuB2oNoDgVOhVfQ4PcRSat9tt
	1bQ/4vP6ZBs62qrX03w+EtmBVHV7VMI2WRgHgAOOFJuTmSQdgQ16TZy6DPLEzMHUPUOr5+w==
X-Gm-Gg: ASbGnctTV6IaN4+BWFU+ogmmColnv2OZqLROGttqoui5vNlrB4domRD5NvRfWcciMwK
	vxVNuzI7QUCrKnit/U5QB950Ls/ZRQIM2uFQYjb+D4LhLMEDZjIGwPAfaLfXkrYyMKjlAlXIIz/
	S+V83mrNUR7wKppmd4D/5QsQWRppC76Sq5UkxknwqJlLw60EHnMFoxjIO7oya1yltWf8hzdg3rW
	kdXaKXXtnbVZwf23V930BB2hH7bvrFA8gjIGLEvxLao/aPMhAFMpk0HTkmD8LIx4Yg//Kxuln3U
	ZJ1JvQHNjTvDzZoLHpZLQy7p6rukO8l/gGsrCaGzqTL1LBDB2scy58ST
X-Received: by 2002:a05:6214:403:b0:70d:ff3a:f96b with SMTP id 6a1803df08f44-70fac89e1acmr152518586d6.44.1756857371116;
        Tue, 02 Sep 2025 16:56:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB9u8oxnT7u5IixuDLd0JsqQC/w6ZeQd7EFEgifkIuiCwykZelS8Lp+UAMgPRJm62ZRJZeJA==
X-Received: by 2002:a05:6214:403:b0:70d:ff3a:f96b with SMTP id 6a1803df08f44-70fac89e1acmr152518396d6.44.1756857370724;
        Tue, 02 Sep 2025 16:56:10 -0700 (PDT)
Received: from x1 ([2600:382:8106:c00:522a:3619:4560:3aa])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b4666156sm19976446d6.39.2025.09.02.16.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:56:10 -0700 (PDT)
Date: Tue, 2 Sep 2025 19:56:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aLeEFzXkPog_dt2B@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Peng,

On Mon, Sep 01, 2025 at 11:51:46AM +0800, Peng Fan wrote:
> Parse the Spread Spectrum Configuration(SSC) from device tree and configure
> them before using the clock.
> 
> Each SSC is three u32 elements which means '<modfreq spreaddepth
> modmethod>', so assigned-clock-sscs is an array of multiple three u32
> elements.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Stephen has also been asking for kunit tests to be added for new
functionality in the clk core. There's already one kunit test that
calls of_clk_set_defaults(). I attached a very rough draft of a patch
showing that it'd be possible to mock this up in a test with what's
already there. I set a log statement with the configuration from
device tree:

test_assigned_rate0: Spread Sprectrum Configuration: modfreq_hz=10000 spread_bp=3 method=1

You can run the kunit tests with:

./tools/testing/kunit/kunit.py run \
	--kunitconfig drivers/clk/.kunitconfig \
	--raw_output=all

Additionally, what do you think about making a dt-bindings include file
for CLK_SSC_CENTER_SPREAD + friends? Right now, the test illustrates
that we need to hardcode the number from the clk-provider.h file inside
the DTS.

Here's the patch and feel free to make it your own as you see fit.

Brian



diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb..6cc3ad883b35 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -28,6 +28,7 @@ static const struct clk_ops empty_clk_ops = { };
 struct clk_dummy_context {
 	struct clk_hw hw;
 	unsigned long rate;
+	struct clk_spread_spectrum sscs;
 };
 
 static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
@@ -83,6 +84,17 @@ static int clk_dummy_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_dummy_set_spread_spectrum(struct clk_hw *hw,
+					 struct clk_spread_spectrum *conf)
+{
+	struct clk_dummy_context *ctx =
+		container_of(hw, struct clk_dummy_context, hw);
+
+	ctx->sscs = *conf;
+
+	return 0;
+}
+
 static int clk_dummy_single_set_parent(struct clk_hw *hw, u8 index)
 {
 	if (index >= clk_hw_get_num_parents(hw))
@@ -100,18 +112,21 @@ static const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_maximize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_minimize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_minimize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_single_parent_ops = {
@@ -3192,7 +3207,13 @@ static int clk_assigned_rates_test_init(struct kunit *test)
 			consumer = of_find_compatible_node(NULL, NULL, "test,clk-consumer"));
 		of_node_put_kunit(test, consumer);
 
+		// Here's an example of a test that shows where
+		// of_clk_set_defaults() is called for the consumer.
 		KUNIT_ASSERT_EQ(test, 0, of_clk_set_defaults(consumer, false));
+		pr_crit("%s: Spread Sprectrum Configuration: modfreq_hz=%u spread_bp=%u method=%u\n",
+			clk_hw_get_name(&ctx->clk0.hw), ctx->clk0.sscs.modfreq_hz,
+			ctx->clk0.sscs.spread_bp, ctx->clk0.sscs.method);
+
 	}
 
 	return 0;
diff --git a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
index a41dca806318..a157a316a10d 100644
--- a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
@@ -14,5 +14,6 @@ kunit-clock-consumer {
 		compatible = "test,clk-consumer";
 		assigned-clocks = <&clk>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <10000 3 1>;
 	};
 };

