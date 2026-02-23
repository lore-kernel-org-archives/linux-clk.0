Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6A835B137
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841316; cv=none; b=J2iEPIncNEQZvEEIgpPNb40fR9+mM/1ESf/75Cvm9K31C19OcQEdmMhHhUktOQjx6azSJ004GCAFPeZrQr9VxJ8sUAJLOx5Jayl+POtr4ar9XVyMwNPlM5jR1vIiIVFg5F4Abl7feOjmiPo5bPwrlT1gNMyBwi9PeOKsZ0ccfII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841316; c=relaxed/simple;
	bh=fgB/iwLbohKh980nUt8XO9waGZx3cLIN28KQTHavg30=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nAKWD79NmGuZFUrarAaKw30STkA8/jXIBFCP7fA79Ci1+zKDsFbkv3atECuP+vkB8k3mHcwWxeGvrI4cgvlQs+nRXAEfh2MQT4fZ+xyfxezYJxoBJNZP+2vxGgovSn9tot+uCHAopnox25iwOMu9wv86ILsDVLPVjMpzvPW9BaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CVkWbQQ5; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CVkWbQQ5"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6581a45f30eso3790260a12.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771841314; x=1772446114; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wlxVSXIBEWmbvlrro6jhFkd5VzymdyQh6rt270iLHWc=;
        b=CVkWbQQ5Nw2UzIg13fmKwYYfkto5D7nCK/icW4sK686SZ9DPetQkW+7B4p2h7XZuJH
         neivNcqMbqScTwxXHzxnnw3HEkZ59mUCzeZsYmHEyPO5HUYeBJLAvZHX1lo94oprRoGe
         OgqnS+flELXLDswvPqhFXrAsjC3p4p5WTohXOuXBXUQAQQZTgxFtPO6j82n16g407gPW
         /Z9uHcIb97QafON2taanvFk1Ub21TLAQ/XQQudi4WBqHAVnfHuVmmcmMyIqgd57y7MDn
         Nw5I6nxO1DrjEr1Q6vck+uulfmQAGuuTT1B4epH25GqxzkN348gGagNn0yX6T7OLbR79
         Yblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841314; x=1772446114;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlxVSXIBEWmbvlrro6jhFkd5VzymdyQh6rt270iLHWc=;
        b=xN+Sd2yys/KgXpx+JFL6PCqTmHnwtEf+7Q2vHT6IMvDo9m/UNk1ueagp9wRlx8qixm
         DN4R5r70G+YmgIh9Up+tT3ceqpm4O2kAMPOe2gl57X3kvTIz4D6tNzV8WWMy+bOHcMeP
         U+/7qpJHlkyjBzPn6NwNCy6ymDKjFYZt9fSWaDAHE42RC0lsLSiWUu6v1TAAmLfO5b0D
         8VJtVIVdv7KxrvYdLZZxeCj8JqsUC+wNTWc+NCaWuyZLM6bryKIo55ND2LynSUrhBMdb
         +Vh/ix9UZs/UY4bGK3z/dUbsIX2QACONofArPQudQrY1UhEDxmCuZK8sRM9FHlTH5Kdi
         /OCg==
X-Forwarded-Encrypted: i=1; AJvYcCWV27qJZBuW1zFyJ2i8EaAq6bMpEZAW2T/kCWYZkiZ7NX6OHTBOIOXTx/gophE5gF81L/OQBm9nIf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0S8LM4V+ckoq+qqqifnGoG+AURvvx+BcefeXV+PNM6akD6y6d
	NnMK16smSSJ80FzvtxEk29V+Of6MZINL2hCs6ECfRfjoxOSGMlMvnrBHS4qCpQUGsS3V1gu/aIK
	QDXUmUzYWlGziVhkFPw==
X-Received: from edbbc7.prod.google.com ([2002:a05:6402:2047:b0:654:503e:5179])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4017:b0:65c:2120:4055 with SMTP id 4fb4d7f45d1cf-65ea4ef5fc1mr4684466a12.17.1771841313635;
 Mon, 23 Feb 2026 02:08:33 -0800 (PST)
Date: Mon, 23 Feb 2026 10:08:24 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABgnnGkC/3XMQWrDMBCF4asErTNlZjSu5a56j9CFLI8dkcQqV
 jEJwXevEmhLHbJ8D77/arJOUbN521zNpHPMMY1lVNuNCXs/DgqxK9swcoUNCoTjAbKOHeTLGMC
 G3te9KAVlU8znpH0833u7j7L3MX+l6XLPz3R7n5VmAgJxHbK1jNq69yGl4agvIZ3MLTXzLydkX
 HMGBBHfVtZ6RScP3P5xJrfmtnAV17JyT+rDA5cf/opEds2l8Jq4DXXXiK+bf3xZlm9QTlKAaAE AAA==
X-Change-Id: 20250904-clk-send-sync-3cfa7f4e1ce2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fgB/iwLbohKh980nUt8XO9waGZx3cLIN28KQTHavg30=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCcbiIu+R+hONicI/5HczHhqmbqxSjeE33oZ0
 C7LVlUNYxWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwnGwAKCRAEWL7uWMY5
 RjabEACzuGAOA16XYr7603EjsixgD4+MZeZHTazYT1169bUuHnSo3QoKPuZkN1kdkRtOy6YgOnk
 PpsY6nAPlmM0rSpPPTgq9GIYMuxGj8Ncp+2R84WBToDSn61axTSzHSJsE9iF2fGPtV+yQiQ5vo2
 Wr1RWr1ZfNnK0cHGL8ImbArrHUMZH3C/JAQKwPMFCTVUFH3i0LQlMGy44A8oo0yqQpCgqVJKUuj
 G5GT6RLyPmcLcd+7jsV/qaDOGyc+/gkF/yfTDsk0DV5IhgVqsHG7iO5F3Jl6tbX3JRe0q1UtEVe
 7ApNIttnFsBpF5n49tj+RfyrshVI9EjWZE7f4E0eCo8+MBnNgqRyeJfb7UFPh4W0B/G16NfLu38
 SkMbrLJnalt7IfA2B3/Oi8W1jg5K7Rw0NPuRc0X4ws04qON7jEq3TtAjwuj9vbGWzPOAdDCeP9A
 MpQOXyzsTfF9E4Z3QTFYYYEUiVVzK9takPy8oiYp+1AZEH3zMoRp360GegLQK4X1SHi3MhGUzI6
 wgKiWEBU4vSCqHTmcnMwNtuY7551LnVrn5oHjRH27Fe4muJgovNbenKsfGRx2Ud45xKMiKAUCxR
 AM6DCKpA9r8XIfinK5fFvyADHVdFilFkYAf0KOjo+zqa/h8g6WY6BgUNBLHTi13GZumE7phzwrl HXc+BH6rkn6/Ssg==
X-Mailer: b4 0.14.2
Message-ID: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
Subject: [PATCH v5 0/3] Implement Send and Sync for clk
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="utf-8"

The Clk type is thread-safe, so let's mark it as thread-safe in the type
system. This lets us get rid of hacks in drivers.

For Stephen's clk tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v5:
- Rebase on v7.0-rc1.
- Pick up Reviewed-by tags.
- Link to v4: https://lore.kernel.org/r/20260113-clk-send-sync-v4-0-712bc7d94a79@google.com

Changes in v4:
- Pick up Reviewed-by tags.
- Link to v3: https://lore.kernel.org/r/20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com

Changes in v3:
- Rebase on v6.19-rc1.
- Pick up tags.
- Add fix for pwm driver as well.
- Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-44ab533ae084@google.com

Changes in v2:
- Rebase on v6.18-rc1.
- Add patch to tyr driver.
- Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.com

---
Alice Ryhl (3):
      rust: clk: implement Send and Sync
      tyr: remove impl Send/Sync for TyrData
      pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData

 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 drivers/pwm/pwm_th1520.rs     | 15 ---------------
 rust/kernel/clk.rs            |  7 +++++++
 3 files changed, 7 insertions(+), 27 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250904-clk-send-sync-3cfa7f4e1ce2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

