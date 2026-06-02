Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988232222C5;
	Tue,  2 Jun 2026 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409384; cv=none; b=buRDxUDX+uq89RruCa6yCJio4OfXxd2HGusElnZCIbQ4wo64t88IOEFsj66TukbTsW4MyusOPyc88avlNom9qQbtcCz1qoEZZcbYzhnYzBHqoQnKBqca7XmDzvfvNnX7noMpzu+lPtQOAaUDMoKj7++uEg/Qln808n4MUCuIF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409384; c=relaxed/simple;
	bh=5KWqCFMcUxryMxItr1z/O7TedGEJQx4UDIsOUebuyp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzlLJhtBm7DvNxzXhP7aprEeMkvAdwN27EXfo7ivFT7dbU+hL2RF+rFtbIrLYTXKPr5YrpxrUi8NrjancgHu+qBTpCFK8WrV32ElV+GFVOkEPK97e6icJGsj4wSu6wc7x//Lxn4pEPnTJAoiXwRp7dsxQgpZUtN2ajPNf9jn+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=hLKT2g9V; arc=none smtp.client-ip=136.144.136.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="hLKT2g9V"
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4gVCPq3wt2zQvvLC;
	Tue,  2 Jun 2026 16:09:35 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gVCPp6nmlzJjhXw;
	Tue,  2 Jun 2026 16:09:34 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 0/3] clk: qcom: gdsc: three pre-existing correctness fixes
Date: Tue,  2 Jun 2026 16:09:31 +0200
Message-ID: <20260602140934.796697-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780409375; h=from:subject:to:cc:date:
 mime-version; bh=NxLXJtPfFfqWQ1Ke4/5Lq5bjEY56fWonFGkWetDXPqA=;
 b=hLKT2g9VMsYWsj13WOgZnLN3ChEe2h8/85hbDbi4SjITge5L4zoLp9oUUMeGJfX+PN3oj3
 UFMkg4Yrj0XysRQzJroxWjU3sA+ZRB7ZIpwkfMcWRlfgUTpGhXXzqJJlDMHvobEXxWzsjo
 h8E/T7xTcEYws3GwhqzFCsrEckUtAt4lWEymnJjoDXmZ/OWuslm7LWrHf+gYaD7MvPsRDI
 44IuspC1bCyXo0Jokf0o6rfPeRDvXF/06Hz2+TVbb38qpsKrTrKVlmjEVk968tbbs+nRHV
 AoSByaZgq3jhX7UFYPPvBsWHAytZxw+NfezSHC2IZhRtGTGsTV13fzgZVf9GCw==
X-Report-Abuse-To: abuse@transip.nl

While preparing MSM8x60 support for the GDSC core (a separate series,
adding LEGACY_FOOTSWITCH and RPM_ALWAYS_ON), code review surfaced
three pre-existing correctness issues in drivers/clk/qcom/gdsc.c that
are independent of any new SoC enabling work. This series collects
those three fixes so each can be reviewed and queued on its own
schedule without blocking the MSM8x60 series.

  1/3 - gdsc_poll_status: propagate gdsc_check_status() errno

      The polling helper treats any non-zero gdsc_check_status() return
      as "reached the target state". gdsc_check_status() returns < 0
      on regmap_read() failure (e.g. parent regmap unbinding, bus
      protection, debug-tool CSR removal). The boolean test promotes
      that negative errno to "true" and the poll returns success with
      the hardware state unknown -- silently misleading
      gdsc_toggle_logic() and the gdsc_init() sync path.

  2/3 - gdsc_init: propagate gdsc_enable() failure for ALWAYS_ON

      GENPD_FLAG_ALWAYS_ON requires the domain to be ON at
      pm_genpd_init() time. When the cold readback finds an ALWAYS_ON
      GDSC powered down, gdsc_init() tries to bring it back up but
      discards the gdsc_enable() return value. If the enable fails the
      code still sets on=true and registers the domain as ALWAYS_ON,
      so genpd reports "on" while the silicon is actually off and
      consumer probes hang on dead registers.

  3/3 - gdsc_unregister: tear down per-domain genpds + reorder

      gdsc_unregister() removes the OF provider entry and tears down
      the parent/subdomain wiring, but never calls pm_genpd_remove()
      on the individual generic_pm_domain structures registered by
      gdsc_init(). The dangling entries on gpd_list cause the next
      gdsc_init() to fail with -EEXIST on deferred-probe replay,
      module reload, or OF-overlay teardown. While here, of_genpd_-
      del_provider() is moved ahead of gdsc_pm_subdomain_remove() so
      that a racing of_genpd_get_from_provider() cannot attach to a
      domain that is mid-removal.

The three changes are independent and could in principle be sent as
separate one-off patches, but they share a single file and the cover
letter makes it easier to reason about them together. Apply order is
not significant: each patch stands on its own.

Built and boot-tested on an HP TouchPad (APQ8060) in conjunction with
the MSM8x60 GDSC enabling series.

Herman van Hazendonk (3):
  clk: qcom: gdsc: propagate gdsc_check_status() errors from
    gdsc_poll_status
  clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
  clk: qcom: gdsc: tear down per-domain genpds in gdsc_unregister()

 drivers/clk/qcom/gdsc.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)


base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
--
2.43.0

